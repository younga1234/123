#!/bin/bash
# 위험한 Bash 명령어 체크

COMMAND="$1"

# 위험한 명령어 리스트
DANGEROUS_COMMANDS="rm -rf|mkfs|dd|:(){:|:&};:|chmod -R 777|> /dev/sda"

if echo "$COMMAND" | grep -qE "$DANGEROUS_COMMANDS"; then
    echo "🚨 위험한 명령어가 감지되었습니다!"
    echo "   명령어: $COMMAND"
    echo ""
    echo "   이 명령어는 시스템에 심각한 피해를 줄 수 있습니다."
    echo "   정말 실행하시겠습니까?"
    echo ""
    exit 1
fi

# sudo 사용 경고
if echo "$COMMAND" | grep -q "sudo"; then
    echo "⚠️  sudo 명령어를 사용하려고 합니다."
    echo "   관리자 권한이 필요한 작업입니다."
    echo ""
fi
