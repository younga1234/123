#!/bin/bash
# .env 파일의 API 키 체크

if [ -f ".env" ]; then
    if [ ! -f ".env.example" ]; then
        echo "💡 .env.example 파일을 만들어두면 좋습니다."
        echo "   다른 개발자들이 필요한 환경변수를 알 수 있습니다."
    fi

    # .gitignore에 .env가 있는지 확인
    if [ -f ".gitignore" ]; then
        if ! grep -q "^\.env$" .gitignore; then
            echo "🚨 .env 파일이 .gitignore에 없습니다!"
            echo "   민감한 정보가 Git에 커밋될 수 있습니다."
        fi
    fi
fi
