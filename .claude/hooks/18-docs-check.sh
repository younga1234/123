#!/bin/bash
# 문서화 상태 체크

if [ ! -f "README.md" ]; then
    echo "📚 README.md 파일이 없습니다."
    echo "   /generate-readme 명령으로 생성하세요."
    echo ""
fi

if [ -d "src" ] || [ -d "lib" ]; then
    if [ ! -f "CONTRIBUTING.md" ]; then
        echo "💡 CONTRIBUTING.md가 없습니다."
        echo "   협업을 위해 기여 가이드를 작성하세요."
    fi
fi
