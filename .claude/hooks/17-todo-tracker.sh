#!/bin/bash
# TODO 코멘트 추적

FILE_PATH="$1"

if [ -f "$FILE_PATH" ]; then
    TODOS=$(grep -n "TODO\|FIXME\|HACK\|XXX" "$FILE_PATH" 2>/dev/null)

    if [ -n "$TODOS" ]; then
        echo "📋 TODO 항목 발견:"
        echo "$TODOS" | while read -r line; do
            echo "   $line"
        done
        echo ""
    fi
fi
