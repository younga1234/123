# 🔄 GitHub 자동 동기화 가이드

**파일 저장만 하면 자동으로 GitHub에 동기화!**

---

## 🚀 빠른 시작

### 1단계: 활성화 확인
```bash
cat .claude/auto-sync.conf
```

기본적으로 활성화되어 있습니다!

### 2단계: 파일 수정 후 저장
아무 파일이나 수정하고 저장하세요.

### 3단계: 자동 동기화 확인
```bash
git log -1
```

자동으로 커밋된 것을 확인할 수 있습니다!

---

## 📚 구성 요소

### ✅ Skill #101
`.claude/skills/101-github-auto-sync.md`
- 지식 참조 문서
- 동작 방식 설명

### ⚡ Command
`.claude/commands/git-auto-sync.md`
- `/git-auto-sync` - 상태 확인
- `/git-auto-sync --enable` - 활성화
- `/git-auto-sync --disable` - 비활성화
- `/git-auto-sync --now` - 즉시 동기화

### 🎣 Hook
`.claude/hooks/auto-sync-on-save.sh`
- **실제로 작동하는** 쉘 스크립트
- 파일 저장 시 자동 실행
- 민감 정보 자동 감지
- 스마트 커밋 메시지 생성

### 🤖 Subagent
`.claude/subagents/git-sync-manager.md`
- AI 전문가
- 변경사항 분석
- 커밋 메시지 자동 생성
- 에러 처리

### ⚙️ 설정
`.claude/auto-sync.conf`
- 모든 동작 커스터마이징 가능

---

## 🎯 주요 기능

### 1. 자동 커밋 메시지 생성
```
변경: src/auth.js, test/auth.test.js
    ↓
메시지: "feat: Add user authentication with tests"
```

### 2. 민감 정보 자동 감지
```
API_KEY="sk-1234..." 발견
    ↓
🚨 동기화 중단!
    ↓
해결 방법 제시
```

### 3. 대용량 파일 경고
```
video.mp4 (50MB) 발견
    ↓
⚠️ 경고: Git LFS 사용 권장
```

### 4. 충돌 자동 해결
```
Push 실패 (원격이 최신)
    ↓
자동으로 pull --rebase
    ↓
재시도
```

---

## 📖 사용 예시

### 예시 1: 일반적인 워크플로우
```bash
# 1. 코드 작성
vim src/app.js

# 2. 파일 저장 (Ctrl+S)
# → 자동으로 커밋 & 푸시!

# 3. GitHub에서 확인
# 바로 동기화되어 있음!
```

### 예시 2: 여러 파일 수정
```bash
# 여러 파일 수정
vim src/auth.js
vim src/api.js
vim test/auth.test.js

# 모두 저장
# → 30초 후 자동으로 그룹핑하여 커밋!

# 커밋 메시지:
# "feat: Add authentication module (A:1 M:2 D:0)"
```

### 예시 3: 민감 정보 방지
```bash
# .env 파일에 API 키 추가
echo "API_KEY=secret123" >> .env

# 저장 시도
# → 🚨 민감 정보 감지!
# → 동기화 중단
# → 해결 방법 안내
```

---

## ⚙️ 설정 변경

### 자동 푸시 비활성화
```conf
# .claude/auto-sync.conf
AUTO_PUSH=false
```
→ 커밋만 하고 푸시는 수동으로

### 체크 간격 변경
```conf
AUTO_SYNC_INTERVAL=60
```
→ 60초마다 체크

### 확인 메시지 활성화
```conf
REQUIRE_CONFIRMATION=true
```
→ 동기화 전 확인 요청

---

## 🔧 수동 제어

### 즉시 동기화
```bash
/git-auto-sync --now
```

### 상태 확인
```bash
/git-auto-sync
```

### 비활성화
```bash
/git-auto-sync --disable
```

### 재활성화
```bash
/git-auto-sync --enable
```

---

## 🛡️ 안전 장치

### 1. 무한 루프 방지
잠금 파일 (`.claude/.auto-sync.lock`) 사용

### 2. 민감 정보 보호
자동으로 다음을 감지:
- API 키
- 비밀번호
- 토큰
- Private 키

### 3. 대용량 파일 경고
10MB 이상 파일 경고

### 4. 보호된 브랜치
main/master 브랜치 직접 푸시 시 경고

### 5. 충돌 자동 해결
pull --rebase로 자동 병합 시도

---

## 🐛 트러블슈팅

### 문제: 자동 동기화가 작동하지 않음
**해결:**
```bash
# 1. 활성화 상태 확인
grep AUTO_SYNC_ENABLED .claude/auto-sync.conf

# 2. Hook 실행 권한 확인
ls -la .claude/hooks/auto-sync-on-save.sh

# 3. 수동으로 실행해보기
/git-auto-sync --now
```

### 문제: "Permission denied" 에러
**해결:**
```bash
# Hook 실행 권한 부여
chmod +x .claude/hooks/auto-sync-on-save.sh
```

### 문제: 푸시가 실패함
**해결:**
```bash
# 1. 원격 저장소 확인
git remote -v

# 2. 인증 확인
git config user.name
git config user.email

# 3. SSH 키 확인
ssh -T git@github.com
```

---

## 💡 팁

### 개인 프로젝트에 적합
- 빠른 백업
- 버전 관리 자동화
- 실수 걱정 없음

### 팀 프로젝트에서는
- 팀원과 합의 필요
- 브랜치 전략 수립
- 리뷰 프로세스 고려

### 프로토타이핑할 때
- 빠른 반복
- 즉시 공유
- 버전 추적

---

## 📊 로그 확인

```bash
# 동기화 히스토리 확인
cat .claude/.sync-history.log

# 최근 10개 동기화 확인
tail -n 10 .claude/.sync-history.log
```

---

## 🎉 완료!

이제 파일을 저장하기만 하면 자동으로 GitHub에 동기화됩니다!

**즐거운 코딩 되세요!** 🚀
