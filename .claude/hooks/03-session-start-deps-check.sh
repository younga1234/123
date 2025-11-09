#!/bin/bash
# 의존성 체크

if [ -f "package.json" ] && [ ! -d "node_modules" ]; then
    echo "⚠️  node_modules가 없습니다."
    echo "   /install-deps 명령으로 의존성을 설치하세요."
fi

if [ -f "requirements.txt" ] && [ ! -d "venv" ] && [ ! -d ".venv" ]; then
    echo "💡 Python 가상환경이 없습니다."
    echo "   가상환경을 만들고 의존성을 설치하세요."
fi
