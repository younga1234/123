#!/bin/bash
# GitHub 자동 동기화 Hook - 파일 저장 시 실행
# 이 Hook은 파일이 저장될 때마다 자동으로 GitHub에 동기화합니다

set -e

# 설정 파일 로드
CONFIG_FILE=".claude/auto-sync.conf"
LOCK_FILE=".claude/.auto-sync.lock"

# 기본 설정
AUTO_SYNC_ENABLED=${AUTO_SYNC_ENABLED:-true}
AUTO_PUSH=${AUTO_PUSH:-true}
MIN_CHANGES=${MIN_CHANGES:-1}
MAX_FILE_SIZE=${MAX_FILE_SIZE:-10}  # MB
EXCLUDE_PATTERNS=${EXCLUDE_PATTERNS:-"node_modules,.env,*.log,.DS_Store"}

# 설정 파일이 있으면 로드
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

# 비활성화 상태면 종료
if [ "$AUTO_SYNC_ENABLED" != "true" ]; then
    exit 0
fi

# 잠금 파일 체크 (무한 루프 방지)
if [ -f "$LOCK_FILE" ]; then
    # 잠금 파일이 5분 이상 오래되면 제거 (데드락 방지)
    if [ $(find "$LOCK_FILE" -mmin +5 2>/dev/null | wc -l) -gt 0 ]; then
        rm -f "$LOCK_FILE"
    else
        exit 0  # 이미 동기화 중
    fi
fi

# 잠금 파일 생성
touch "$LOCK_FILE"

# 종료 시 잠금 파일 제거
trap "rm -f $LOCK_FILE" EXIT

# Git 저장소 체크
if [ ! -d ".git" ]; then
    echo "⚠️  Git 저장소가 아닙니다. 자동 동기화 건너뜀."
    exit 0
fi

# 현재 브랜치 확인
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
if [ -z "$CURRENT_BRANCH" ]; then
    echo "⚠️  현재 브랜치를 확인할 수 없습니다."
    exit 1
fi

# 변경사항 체크
CHANGES=$(git status --porcelain 2>/dev/null)
if [ -z "$CHANGES" ]; then
    # 변경사항 없음
    exit 0
fi

# 변경된 파일 수 계산
CHANGED_COUNT=$(echo "$CHANGES" | wc -l | tr -d ' ')

# 최소 변경사항 수 체크
if [ "$CHANGED_COUNT" -lt "$MIN_CHANGES" ]; then
    exit 0
fi

echo "🔄 GitHub 자동 동기화 시작..."
echo "   변경된 파일: ${CHANGED_COUNT}개"

# 제외 패턴 체크 함수
should_exclude() {
    local file="$1"
    IFS=',' read -ra PATTERNS <<< "$EXCLUDE_PATTERNS"
    for pattern in "${PATTERNS[@]}"; do
        if [[ "$file" == *"$pattern"* ]]; then
            return 0  # 제외
        fi
    done
    return 1  # 포함
}

# 민감 정보 체크 함수
check_sensitive_info() {
    local file="$1"

    # 바이너리 파일은 건너뜀
    if ! file "$file" | grep -q text; then
        return 1
    fi

    # 민감 정보 패턴
    SENSITIVE_PATTERNS=(
        "api.?key.*=.*['\"][a-zA-Z0-9]"
        "password.*=.*['\"][^'\"]*['\"]"
        "secret.*=.*['\"][^'\"]*['\"]"
        "token.*=.*['\"][a-zA-Z0-9]"
        "private.?key"
        "BEGIN.*PRIVATE.*KEY"
    )

    for pattern in "${SENSITIVE_PATTERNS[@]}"; do
        if grep -qiE "$pattern" "$file" 2>/dev/null; then
            return 0  # 민감 정보 발견
        fi
    done

    return 1
}

# 대용량 파일 체크 함수
check_large_file() {
    local file="$1"
    local size_mb=$(du -m "$file" 2>/dev/null | cut -f1)

    if [ "$size_mb" -gt "$MAX_FILE_SIZE" ]; then
        return 0  # 대용량 파일
    fi

    return 1
}

# 변경된 파일 분석
ADDED_FILES=()
MODIFIED_FILES=()
DELETED_FILES=()
SENSITIVE_FILES=()
LARGE_FILES=()

while IFS= read -r line; do
    status="${line:0:2}"
    file="${line:3}"

    # 제외 패턴 체크
    if should_exclude "$file"; then
        continue
    fi

    # 파일 상태별 분류
    case "$status" in
        "A "*)
            ADDED_FILES+=("$file")
            ;;
        "M "*)
            MODIFIED_FILES+=("$file")
            ;;
        "D "*)
            DELETED_FILES+=("$file")
            ;;
        ?M*)
            MODIFIED_FILES+=("$file")
            ;;
    esac

    # 민감 정보 체크 (삭제된 파일 제외)
    if [ -f "$file" ]; then
        if check_sensitive_info "$file"; then
            SENSITIVE_FILES+=("$file")
        fi

        # 대용량 파일 체크
        if check_large_file "$file"; then
            LARGE_FILES+=("$file")
        fi
    fi
done <<< "$CHANGES"

# 민감 정보 발견 시 중단
if [ ${#SENSITIVE_FILES[@]} -gt 0 ]; then
    echo "🚨 민감 정보가 포함된 파일 발견!"
    for file in "${SENSITIVE_FILES[@]}"; do
        echo "   - $file"
    done
    echo ""
    echo "⚠️  자동 동기화 중단"
    echo "   해결 방법:"
    echo "   1. 민감 정보를 환경변수로 이동"
    echo "   2. .gitignore에 파일 추가"
    echo "   3. .env 파일 사용"
    exit 1
fi

# 대용량 파일 경고
if [ ${#LARGE_FILES[@]} -gt 0 ]; then
    echo "⚠️  대용량 파일 발견 (${MAX_FILE_SIZE}MB 초과):"
    for file in "${LARGE_FILES[@]}"; do
        size=$(du -h "$file" | cut -f1)
        echo "   - $file ($size)"
    done
    echo ""
    echo "💡 Git LFS 사용을 고려하세요"
    # 경고만 하고 계속 진행
fi

# 스마트 커밋 메시지 생성
generate_commit_message() {
    local added=${#ADDED_FILES[@]}
    local modified=${#MODIFIED_FILES[@]}
    local deleted=${#DELETED_FILES[@]}

    local msg=""
    local type="chore"

    # 파일 유형 분석
    local has_src=false
    local has_test=false
    local has_docs=false
    local has_config=false

    for file in "${ADDED_FILES[@]}" "${MODIFIED_FILES[@]}"; do
        case "$file" in
            src/*|lib/*|app/*)
                has_src=true
                ;;
            test/*|*.test.*|*.spec.*)
                has_test=true
                ;;
            *.md|docs/*)
                has_docs=true
                ;;
            *.json|*.yml|*.yaml|*.conf|*.config.*)
                has_config=true
                ;;
        esac
    done

    # 타입 결정
    if [ "$has_src" = true ] && [ "$added" -gt 0 ]; then
        type="feat"
    elif [ "$has_src" = true ] && [ "$modified" -gt 0 ]; then
        type="fix"
    elif [ "$has_test" = true ]; then
        type="test"
    elif [ "$has_docs" = true ]; then
        type="docs"
    elif [ "$has_config" = true ]; then
        type="chore"
    fi

    # 메시지 생성
    if [ "$added" -gt 0 ] && [ "$modified" -eq 0 ] && [ "$deleted" -eq 0 ]; then
        msg="$type: Add ${added} new file(s)"
    elif [ "$modified" -gt 0 ] && [ "$added" -eq 0 ] && [ "$deleted" -eq 0 ]; then
        msg="$type: Update ${modified} file(s)"
    elif [ "$deleted" -gt 0 ] && [ "$added" -eq 0 ] && [ "$modified" -eq 0 ]; then
        msg="$type: Remove ${deleted} file(s)"
    else
        msg="$type: Update project (A:${added} M:${modified} D:${deleted})"
    fi

    # 주요 파일 추가
    if [ ${#ADDED_FILES[@]} -gt 0 ]; then
        local first_file=$(basename "${ADDED_FILES[0]}")
        msg="$msg - $first_file"
    elif [ ${#MODIFIED_FILES[@]} -gt 0 ]; then
        local first_file=$(basename "${MODIFIED_FILES[0]}")
        msg="$msg - $first_file"
    fi

    echo "$msg"
}

COMMIT_MESSAGE=$(generate_commit_message)

echo "📝 커밋 메시지: $COMMIT_MESSAGE"

# Git add
echo "📦 변경사항 추가 중..."
git add . 2>&1 | grep -v "warning:" || true

# Git commit
echo "💾 커밋 생성 중..."
if git commit -m "$COMMIT_MESSAGE" --quiet; then
    echo "✅ 커밋 완료"
else
    echo "⚠️  커밋 실패 (변경사항 없음)"
    exit 0
fi

# Auto push 활성화 시 푸시
if [ "$AUTO_PUSH" = "true" ]; then
    echo "📤 GitHub로 푸시 중..."

    # 원격 브랜치 존재 확인
    if git ls-remote --exit-code --heads origin "$CURRENT_BRANCH" >/dev/null 2>&1; then
        # Pull with rebase (충돌 방지)
        echo "   Pull with rebase..."
        if ! git pull --rebase origin "$CURRENT_BRANCH" --quiet 2>&1; then
            echo "⚠️  Pull 실패 - 충돌 가능성"
            echo "   수동으로 해결 필요: git pull origin $CURRENT_BRANCH"
            exit 1
        fi

        # Push
        echo "   Pushing..."
        if git push origin "$CURRENT_BRANCH" --quiet 2>&1; then
            COMMIT_HASH=$(git rev-parse --short HEAD)
            echo "✅ 동기화 완료!"
            echo "   브랜치: $CURRENT_BRANCH"
            echo "   커밋: $COMMIT_HASH"
        else
            echo "❌ Push 실패"
            echo "   수동으로 푸시하세요: git push origin $CURRENT_BRANCH"
            exit 1
        fi
    else
        # 원격 브랜치가 없으면 새로 생성
        echo "   새 브랜치 푸시..."
        if git push -u origin "$CURRENT_BRANCH" --quiet 2>&1; then
            echo "✅ 새 브랜치 생성 및 푸시 완료!"
        else
            echo "❌ Push 실패"
            exit 1
        fi
    fi
else
    echo "ℹ️  자동 푸시 비활성화 상태"
    echo "   수동 푸시: git push origin $CURRENT_BRANCH"
fi

echo ""
echo "🎉 GitHub 자동 동기화 완료!"
