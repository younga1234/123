#!/bin/bash
# 의존성 보안 스캔

if [ -f "package.json" ]; then
    if command -v npm &> /dev/null; then
        echo "🔒 보안 취약점 스캔 중..."
        AUDIT_OUTPUT=$(npm audit --json 2>/dev/null)

        if echo "$AUDIT_OUTPUT" | grep -q '"high"'; then
            echo "  🚨 높은 수준의 보안 취약점 발견!"
            echo "     npm audit fix 를 실행하세요."
        fi
    fi
fi
