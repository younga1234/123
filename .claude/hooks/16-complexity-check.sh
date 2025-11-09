#!/bin/bash
# 코드 복잡도 체크

FILE_PATH="$1"

if [ -f "$FILE_PATH" ]; then
    # 파일 라인 수 체크
    LINES=$(wc -l < "$FILE_PATH")

    if [ $LINES -gt 300 ]; then
        echo "📏 파일이 너무 깁니다 (${LINES} 줄)"
        echo "   /refactor 명령으로 파일을 분리하는 것을 고려하세요."
    fi

    # 함수 길이 체크 (간단한 휴리스틱)
    if [[ "$FILE_PATH" == *.js ]] || [[ "$FILE_PATH" == *.ts ]]; then
        LONG_FUNCTIONS=$(grep -n "function\|=>" "$FILE_PATH" | wc -l)
        if [ $LONG_FUNCTIONS -gt 20 ]; then
            echo "🔧 함수가 많습니다 (${LONG_FUNCTIONS}개)"
            echo "   모듈화를 고려하세요."
        fi
    fi
fi
