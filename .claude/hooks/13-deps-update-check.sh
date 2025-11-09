#!/bin/bash
# 주기적으로 의존성 업데이트 확인

LAST_CHECK_FILE=".claude/.last-deps-check"
CURRENT_TIME=$(date +%s)

if [ -f "$LAST_CHECK_FILE" ]; then
    LAST_CHECK=$(cat "$LAST_CHECK_FILE")
    DAYS_SINCE=$((($CURRENT_TIME - $LAST_CHECK) / 86400))

    if [ $DAYS_SINCE -gt 7 ]; then
        echo "📦 의존성을 7일 이상 업데이트하지 않았습니다."
        echo "   /install-deps 명령으로 업데이트를 확인하세요."
        echo ""
    fi
else
    echo "$CURRENT_TIME" > "$LAST_CHECK_FILE"
fi
