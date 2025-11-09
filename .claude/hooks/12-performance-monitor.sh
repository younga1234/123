#!/bin/bash
# 명령 실행 시간 측정

START_TIME=$(date +%s)

# 원래 명령 실행
"$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

if [ $DURATION -gt 5 ]; then
    echo ""
    echo "⏱️  실행 시간: ${DURATION}초"
    echo "   (5초 이상 걸렸습니다)"
fi
