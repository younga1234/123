# GitHub 자동 동기화

사용자 요청 없이 Git 변경사항을 자동으로 GitHub에 동기화합니다.

## 설명
파일이 변경되면 자동으로:
1. 변경사항 감지
2. Git에 추가
3. 자동 커밋 (의미있는 메시지)
4. GitHub로 푸시

## 사용 방법

### 자동 모드 (Hook 자동 실행)
파일을 저장하면 자동으로 동기화됩니다.

### 수동 모드 (Command 실행)
```bash
/git-auto-sync
```

## 주요 기능

### 1. 자동 커밋 메시지 생성
변경된 파일을 분석하여 의미있는 커밋 메시지 자동 생성:
- `feat: 새 기능 추가`
- `fix: 버그 수정`
- `docs: 문서 업데이트`
- `style: 코드 포맷팅`
- `refactor: 리팩토링`
- `test: 테스트 추가`
- `chore: 기타 변경사항`

### 2. 스마트 그룹핑
여러 파일 변경을 하나의 의미있는 커밋으로 그룹핑

### 3. 안전 장치
- 무한 루프 방지
- 충돌 자동 해결 시도
- 실패 시 알림

### 4. 설정 가능
`.claude/auto-sync.conf`에서 설정:
```conf
AUTO_SYNC_ENABLED=true
AUTO_SYNC_INTERVAL=30  # 30초마다 체크
AUTO_PUSH=true
REQUIRE_CONFIRMATION=false
```

## 동작 방식

### 자동 감지 트리거
1. 파일 저장 시 (after-write hook)
2. Git 커밋 후 (post-commit hook)
3. 일정 시간마다 (설정 가능)

### 처리 흐름
```
파일 변경 감지
    ↓
변경사항 분석
    ↓
커밋 메시지 생성
    ↓
Git add & commit
    ↓
충돌 체크
    ↓
GitHub push
    ↓
결과 알림
```

## 예외 처리

### 동기화하지 않는 파일
- `node_modules/`
- `.env` (민감 정보)
- `*.log`
- `.DS_Store`
- 임시 파일

### 충돌 발생 시
1. 자동으로 pull 시도
2. 자동 병합 시도
3. 실패하면 사용자에게 알림

## 보안

### 안전 기능
- 민감 정보 자동 감지
- 큰 파일 경고
- 강제 푸시 방지
- 브랜치 보호

## 사용 시나리오

### 시나리오 1: 개발 중
```
1. 코드 작성
2. 파일 저장
3. [자동] Git에 커밋
4. [자동] GitHub에 푸시
5. 계속 개발
```

### 시나리오 2: 협업
```
1. 여러 파일 수정
2. 저장
3. [자동] 의미있는 단위로 그룹핑
4. [자동] 동기화
5. 팀원이 즉시 확인 가능
```

## 비활성화

임시로 비활성화:
```bash
/git-auto-sync --disable
```

다시 활성화:
```bash
/git-auto-sync --enable
```

## 관련 도구
- Command: `/git-auto-sync`
- Hook: `auto-sync-on-save.sh`
- Subagent: `git-sync-manager`
- Config: `.claude/auto-sync.conf`

## 주의사항

⚠️ **주의**:
- 자동 푸시는 실수도 함께 푸시될 수 있습니다
- 중요한 변경사항은 수동 확인 권장
- 팀 프로젝트에서는 팀원과 합의 필요

💡 **팁**:
- 개인 프로젝트에 적합
- 백업 용도로 훌륭
- 작은 변경사항에 유용
