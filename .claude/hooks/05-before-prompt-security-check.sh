#!/bin/bash
# 보안 관련 요청 감지

PROMPT="$1"

if echo "$PROMPT" | grep -qiE "password|비밀번호|secret|api.?key|token|credential"; then
    echo "🔐 보안 정보가 포함될 수 있습니다!"
    echo "   ⚠️  주의: 절대로 실제 비밀번호나 API 키를 공유하지 마세요!"
    echo "   💡 대신 환경변수나 .env 파일을 사용하세요."
    echo ""
fi
