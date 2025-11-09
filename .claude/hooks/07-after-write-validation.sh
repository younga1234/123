#!/bin/bash
# 파일 쓰기 후 검증

FILE_PATH="$1"

if [ -f "$FILE_PATH" ]; then
    # 구문 오류 체크
    EXT="${FILE_PATH##*.}"

    case "$EXT" in
        js|jsx)
            if command -v node &> /dev/null; then
                node --check "$FILE_PATH" 2>/dev/null && echo "✅ JavaScript 구문 검사 통과" || echo "⚠️  JavaScript 구문 오류 발견"
            fi
            ;;
        py)
            if command -v python3 &> /dev/null; then
                python3 -m py_compile "$FILE_PATH" 2>/dev/null && echo "✅ Python 구문 검사 통과" || echo "⚠️  Python 구문 오류 발견"
            fi
            ;;
        json)
            if command -v jq &> /dev/null; then
                jq empty "$FILE_PATH" 2>/dev/null && echo "✅ JSON 형식 검사 통과" || echo "⚠️  JSON 형식 오류 발견"
            fi
            ;;
    esac
fi
