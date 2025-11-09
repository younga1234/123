---
description: GitHub 자동 동기화 관리 (활성화/비활성화/상태확인)
---

GitHub 자동 동기화를 관리합니다.

## 사용법

### 상태 확인
```
/git-auto-sync
```
현재 자동 동기화 상태를 확인합니다.

### 활성화
```
/git-auto-sync --enable
```
자동 동기화를 활성화합니다.

### 비활성화
```
/git-auto-sync --disable
```
자동 동기화를 일시 중지합니다.

### 즉시 동기화
```
/git-auto-sync --now
```
현재 변경사항을 즉시 동기화합니다.

### 설정 보기
```
/git-auto-sync --config
```
현재 설정을 확인합니다.

## 작동 방식

이 명령을 실행하면 `git-sync-manager` Subagent가 다음을 수행합니다:

1. **상태 확인**
   - Git 저장소 확인
   - 브랜치 확인
   - 원격 저장소 연결 확인

2. **변경사항 분석**
   - 수정된 파일 목록
   - 추가된 파일
   - 삭제된 파일

3. **스마트 커밋 메시지 생성**
   변경된 파일을 분석하여 자동으로 의미있는 메시지 생성:
   - 새 파일 → `feat: 새 기능 추가`
   - 버그 수정 → `fix: 버그 수정`
   - 문서 → `docs: 문서 업데이트`
   - 테스트 → `test: 테스트 추가`

4. **Git 작업 수행**
   ```bash
   git add .
   git commit -m "자동 생성된 메시지"
   git pull --rebase origin <branch>
   git push origin <branch>
   ```

5. **결과 알림**
   - 성공: ✅ 동기화 완료
   - 실패: ❌ 에러 메시지와 해결 방법

## 설정

`.claude/auto-sync.conf` 파일을 생성하여 동작을 커스터마이징:

```conf
# 자동 동기화 활성화
AUTO_SYNC_ENABLED=true

# 체크 간격 (초)
AUTO_SYNC_INTERVAL=30

# 자동 푸시 활성화
AUTO_PUSH=true

# 확인 메시지 표시
REQUIRE_CONFIRMATION=false

# 제외할 파일 패턴
EXCLUDE_PATTERNS="node_modules,.env,*.log"

# 커밋 메시지 템플릿
COMMIT_MESSAGE_TEMPLATE="auto: {summary}"

# 최소 변경사항 수 (이 이상일 때만 동기화)
MIN_CHANGES=1

# 최대 파일 크기 (MB)
MAX_FILE_SIZE=10
```

## 안전 장치

### 1. 무한 루프 방지
```
[LOCK] .claude/.auto-sync.lock
```
동기화 중에는 잠금 파일 생성

### 2. 민감 정보 체크
자동으로 감지:
- API 키
- 비밀번호
- 토큰
- 개인 정보

발견 시 동기화 중단 및 경고

### 3. 대용량 파일 경고
10MB 이상 파일 감지 시 확인 요청

### 4. 충돌 자동 해결
```
충돌 발생 → pull --rebase → 자동 병합 → 실패 시 알림
```

## 예시

### 예시 1: 활성화 및 즉시 동기화
```
/git-auto-sync --enable
/git-auto-sync --now
```

**출력:**
```
✅ 자동 동기화 활성화됨

🔄 동기화 시작...

📝 변경사항:
  - M src/index.js
  - A src/components/Header.js
  - D src/old-file.js

💭 커밋 메시지: feat: Add Header component and update index

📤 푸시 중...

✅ 동기화 완료!
   브랜치: main
   커밋: a1b2c3d
   URL: https://github.com/user/repo/commit/a1b2c3d
```

### 예시 2: 상태 확인
```
/git-auto-sync
```

**출력:**
```
🔄 GitHub 자동 동기화 상태

상태: ✅ 활성화
브랜치: main
마지막 동기화: 2분 전
대기 중인 변경사항: 3개 파일

설정:
  - 자동 푸시: ON
  - 체크 간격: 30초
  - 확인 메시지: OFF

다음 작업:
  - 3개 파일이 30초 후 자동 동기화됩니다
  - 즉시 동기화: /git-auto-sync --now
```

### 예시 3: 에러 발생
```
/git-auto-sync --now
```

**출력:**
```
❌ 동기화 실패

에러: 충돌 발생
파일: src/config.js

해결 방법:
1. 수동으로 충돌 해결:
   git pull origin main
   # 충돌 해결
   git push origin main

2. 또는 자동 해결 시도:
   /git-conflict

3. 자동 동기화 일시 중지:
   /git-auto-sync --disable
```

## 트러블슈팅

### 문제: 푸시 실패
**원인:** 원격 브랜치가 로컬보다 앞서 있음
**해결:**
```
/git-auto-sync --now
```
자동으로 pull → rebase → push

### 문제: 민감 정보 경고
**원인:** API 키나 비밀번호 감지
**해결:**
1. 해당 파일을 `.gitignore`에 추가
2. 환경변수로 이동
3. 경고 무시 (권장하지 않음)

### 문제: 너무 자주 동기화
**원인:** 간격이 너무 짧음
**해결:** `.claude/auto-sync.conf`에서 `AUTO_SYNC_INTERVAL` 증가

## Subagent 연동

이 Command는 `git-sync-manager` Subagent를 자동으로 호출합니다.

Subagent는:
- 변경사항 분석
- 커밋 메시지 생성
- Git 작업 수행
- 에러 처리
- 결과 리포트

## Hook 연동

자동 동기화는 다음 Hooks에 의해 트리거됩니다:
- `after-write-auto-sync.sh` - 파일 저장 시
- `post-commit-auto-sync.sh` - 커밋 후
- `periodic-auto-sync.sh` - 주기적으로

## 참고

- Skill #101: GitHub 자동 동기화
- Subagent: git-sync-manager
- Hook: auto-sync-*.sh
- Config: .claude/auto-sync.conf

## 주의사항

⚠️ **경고:**
- 자동 푸시는 실수도 함께 푸시합니다
- 팀 프로젝트에서는 팀원과 상의 필요
- 중요한 커밋은 수동으로 메시지 작성 권장

💡 **추천:**
- 개인 프로젝트나 문서 작업에 적합
- 백업 목적으로 유용
- 프로토타이핑 단계에 좋음
- 완성도가 중요한 프로젝트는 수동 커밋 권장
