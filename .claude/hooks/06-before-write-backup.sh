#!/bin/bash
# 파일 쓰기 전 자동 백업

FILE_PATH="$1"

if [ -f "$FILE_PATH" ]; then
    BACKUP_DIR=".claude/backups"
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_PATH="$BACKUP_DIR/$(basename $FILE_PATH).$TIMESTAMP.bak"
    cp "$FILE_PATH" "$BACKUP_PATH"
    echo "💾 백업 생성: $BACKUP_PATH"
fi
