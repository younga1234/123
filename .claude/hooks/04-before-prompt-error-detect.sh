#!/bin/bash
# 사용자 프롬프트에서 에러 관련 키워드 감지

PROMPT="$1"

if echo "$PROMPT" | grep -qiE "error|에러|오류|실패|failed|bug"; then
    echo "🔍 에러 관련 질문을 감지했습니다."
    echo "   더 나은 도움을 위해 다음을 제공해주세요:"
    echo "   1. 전체 에러 메시지"
    echo "   2. 어떤 작업을 하던 중이었는지"
    echo "   3. 최근 변경사항"
    echo ""
    echo "   /fix-error 명령을 사용하면 자동으로 분석할 수 있습니다."
    echo ""
fi
