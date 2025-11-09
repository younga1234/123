#!/bin/bash
# 새 파일 생성시 테스트 작성 리마인더

FILE_PATH="$1"

if [[ "$FILE_PATH" == *.test.* ]] || [[ "$FILE_PATH" == *.spec.* ]]; then
    exit 0  # 이미 테스트 파일
fi

TEST_FILE_PATTERNS="test spec __tests__"
HAS_TEST=false

for PATTERN in $TEST_FILE_PATTERNS; do
    if find . -path "*$PATTERN*" -name "*$(basename $FILE_PATH)*" 2>/dev/null | grep -q .; then
        HAS_TEST=true
        break
    fi
done

if [ "$HAS_TEST" = false ]; then
    echo "💡 이 파일에 대한 테스트가 없습니다."
    echo "   /write-test 명령으로 테스트를 작성하세요."
    echo ""
fi
