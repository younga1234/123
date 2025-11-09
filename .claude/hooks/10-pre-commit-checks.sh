#!/bin/bash
# 커밋 전 자동 체크

echo "🔍 커밋 전 체크 실행 중..."

# 린트 체크
if [ -f "package.json" ]; then
    if grep -q '"lint"' package.json; then
        echo "  - 린트 체크..."
        npm run lint --silent 2>/dev/null || echo "  ⚠️  린트 경고 발견"
    fi
fi

# 테스트 실행
if [ -f "package.json" ]; then
    if grep -q '"test"' package.json; then
        echo "  - 테스트 실행..."
        npm test --silent 2>/dev/null || echo "  ⚠️  테스트 실패"
    fi
fi

# 민감 정보 체크
echo "  - 민감 정보 체크..."
SENSITIVE_PATTERNS="password.*=|api.?key.*=|secret.*=|token.*="
if git diff --cached | grep -qiE "$SENSITIVE_PATTERNS"; then
    echo "  🚨 민감한 정보가 커밋에 포함되어 있을 수 있습니다!"
    echo "     커밋하기 전에 확인하세요."
fi

echo "✅ 체크 완료"
