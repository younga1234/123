#!/bin/bash
# Git 브랜치 전략 체크

CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)

if [ -n "$CURRENT_BRANCH" ]; then
    if [ "$CURRENT_BRANCH" = "main" ] || [ "$CURRENT_BRANCH" = "master" ]; then
        echo "⚠️  메인 브랜치에서 직접 작업 중입니다."
        echo "   feature/ 또는 bugfix/ 브랜치를 생성하는 것이 좋습니다."
        echo "   /git-branch 명령을 사용하세요."
        echo ""
    fi
fi
