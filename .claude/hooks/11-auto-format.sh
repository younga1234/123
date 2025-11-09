#!/bin/bash
# 파일 저장시 자동 포맷팅

FILE_PATH="$1"
EXT="${FILE_PATH##*.}"

case "$EXT" in
    js|jsx|ts|tsx)
        if command -v prettier &> /dev/null; then
            prettier --write "$FILE_PATH" 2>/dev/null && echo "✨ Prettier 포맷팅 완료"
        fi
        ;;
    py)
        if command -v black &> /dev/null; then
            black "$FILE_PATH" 2>/dev/null && echo "✨ Black 포맷팅 완료"
        fi
        ;;
esac
