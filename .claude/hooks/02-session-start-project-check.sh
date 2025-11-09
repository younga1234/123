#!/bin/bash
# 프로젝트 상태 자동 체크

if [ ! -f "package.json" ] && [ ! -f "requirements.txt" ] && [ ! -f "Cargo.toml" ] && [ ! -f "go.mod" ]; then
    echo "⚠️  프로젝트 설정 파일이 없습니다."
    echo "   /init-project 명령으로 프로젝트를 초기화하세요."
fi

if [ -d ".git" ]; then
    echo "✅ Git 저장소가 설정되어 있습니다."

    # 커밋되지 않은 변경사항 확인
    if [ -n "$(git status --porcelain)" ]; then
        echo "📝 커밋되지 않은 변경사항이 있습니다."
    fi
else
    echo "💡 Git 저장소가 없습니다. /git-init 으로 초기화하세요."
fi
