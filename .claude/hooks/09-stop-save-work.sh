#!/bin/bash
# 작업 중단시 변경사항 저장 제안

if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
    echo "📝 저장되지 않은 변경사항이 있습니다."
    echo "   git stash 또는 git commit으로 작업을 저장하세요."
    echo ""
fi
