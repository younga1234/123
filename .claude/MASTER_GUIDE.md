# 🚀 Claude Code 완벽 가이드

**비개발자를 세계 최고의 개발자로 만드는 완벽한 개발 환경**

---

## 📋 목차

1. [시작하기](#시작하기)
2. [100개 Skills](#100개-skills)
3. [100개 Commands](#100개-commands)
4. [100개 Hooks](#100개-hooks)
5. [100개+ Subagents](#100개-subagents)
6. [워크플로우 예제](#워크플로우-예제)
7. [문제 해결](#문제-해결)

---

## 🎯 시작하기

### VSCode를 켰을 때 해야 할 일

1. **프로젝트가 없다면?**
   ```
   /init-project
   ```
   또는
   ```
   /templates
   ```

2. **프로젝트가 있다면?**
   ```
   /quick-start
   ```

3. **에러가 발생했다면?**
   ```
   /fix-error
   ```

4. **Git을 모른다면?**
   ```
   /git-commit
   ```

---

## 💎 100개 Skills

Skills는 재사용 가능한 지식 모듈입니다.

### 카테고리별 Skills

#### 1-10: 기본 코드 생성
- `01-기본-코드-생성`: Python, JavaScript, HTML 등 모든 언어
- `02-코드-자동-완성`: 작성 중인 코드를 자동 완성
- `03-변수명-추천`: 의미있는 변수명 제안
- `04-함수명-추천`: 명확한 함수명 제안
- `05-주석-자동-삽입`: 자동으로 주석 추가
- `06-코드-리팩토링`: 코드를 더 깔끔하게
- `07-에러-메시지-분석-및-해결`: 에러 해결 도우미
- `08-디버깅-도우미`: 버그 찾기
- `09-코드-리뷰-및-질-좋은-코드-추천`: 코드 품질 향상
- `10-코드-품질-점검`: 전체적인 품질 평가

#### 11-20: 코드 품질 및 최적화
- `11-코드-최적화`: 성능 개선
- `12-api-문서-생성`: API 문서 자동 생성
- `13-코드-스니펫-관리`: 자주 쓰는 코드 저장
- `14-git-명령어-자동-생성`: Git 명령어 제안
- `15-github-통합`: GitHub와 연동
- `16-ci-cd-파이프라인-설정`: 자동 배포
- `17-버전-관리-도우미`: 버전 관리
- `18-테스트-케이스-자동-생성`: 테스트 작성
- `19-유닛-테스트-통합-테스트-자동화`: 테스트 실행
- `20-테스트-결과-해석`: 테스트 결과 분석

#### 21-30: 데이터베이스 및 API
- `21-데이터베이스-스키마-생성`: DB 스키마 설계
- `22-sql-쿼리-자동-생성`: SQL 쿼리 작성
- `23-데이터베이스-연결-설정`: DB 연결
- `24-crud-api-생성`: CRUD API 자동 생성
- `25-restful-api-설계`: REST API 설계
- `26-마이크로서비스-설계`: 마이크로서비스 아키텍처
- `27-프로젝트-구조-추천`: 디렉토리 구조
- `28-아키텍처-설계-도우미`: 시스템 아키텍처
- `29-프로젝트-초기화`: 새 프로젝트 시작
- `30-프로젝트-문서화`: 문서 자동 생성

#### ... 그리고 70개 더!

**전체 목록**: `.claude/skills/` 디렉토리 참조

---

## ⚡ 100개 Commands

Commands는 `/` 로 시작하는 실행 가능한 명령어입니다.

### 자주 사용하는 Commands

#### 프로젝트 시작
```
/init-project          # 새 프로젝트 초기화
/quick-start           # 빠른 시작 가이드
/setup-env             # 환경 설정
/install-deps          # 의존성 설치
/templates             # 템플릿 목록
```

#### 코딩 지원
```
/write-function        # 함수 작성
/complete-code         # 코드 완성
/refactor              # 리팩토링
/optimize              # 최적화
/add-comments          # 주석 추가
```

#### 디버깅
```
/debug                 # 디버깅
/fix-error             # 에러 수정
/trace-bug             # 버그 추적
/check-edge-cases      # 엣지 케이스 확인
/security-check        # 보안 체크
```

#### 테스트
```
/write-test            # 테스트 작성
/run-tests             # 테스트 실행
/test-coverage         # 커버리지 확인
/e2e-test              # E2E 테스트
```

#### Git
```
/git-init              # Git 초기화
/git-commit            # 커밋
/git-branch            # 브랜치 생성
/git-conflict          # 충돌 해결
```

#### 문서화
```
/generate-readme       # README 생성
/document-api          # API 문서
/write-docs            # 기술 문서
/changelog             # CHANGELOG 생성
```

#### 배포
```
/build                 # 빌드
/deploy                # 배포
/docker                # Docker 설정
/ci-cd                 # CI/CD 파이프라인
```

#### 데이터베이스
```
/create-schema         # 스키마 생성
/generate-sql          # SQL 생성
/migration             # 마이그레이션
/optimize-query        # 쿼리 최적화
```

#### 보안
```
/add-auth              # 인증 추가
/security-audit        # 보안 감사
/encrypt               # 암호화
/rate-limit            # Rate Limiting
```

#### 고급 기능
```
/ml-model              # ML 모델 생성
/graphql               # GraphQL API
/websocket             # 실시간 통신
/cache                 # 캐싱
/i18n                  # 다국어 지원
/accessibility         # 접근성 개선
```

**전체 목록**: `.claude/commands/` 디렉토리 참조

---

## 🎣 100개 Hooks

Hooks는 특정 이벤트에 자동으로 실행됩니다.

### 주요 Hooks

#### Session Start (세션 시작 시)
- `01-session-start-welcome`: 환영 메시지
- `02-session-start-project-check`: 프로젝트 상태 체크
- `03-session-start-deps-check`: 의존성 체크

#### Before User Prompt (사용자 입력 전)
- `04-before-prompt-error-detect`: 에러 관련 키워드 감지
- `05-before-prompt-security-check`: 보안 정보 체크

#### Tool Use (도구 사용 시)
- `06-before-write-backup`: 파일 쓰기 전 백업
- `07-after-write-validation`: 파일 쓰기 후 검증
- `08-before-bash-safety`: 위험한 명령어 체크

#### Pre-Commit (커밋 전)
- `10-pre-commit-checks`: 린트, 테스트, 민감 정보 체크
- `11-auto-format`: 자동 포맷팅

#### 기타
- `13-deps-update-check`: 의존성 업데이트 확인
- `14-test-coverage-reminder`: 테스트 작성 리마인더
- `15-security-scan`: 보안 스캔
- `16-complexity-check`: 코드 복잡도 체크
- `17-todo-tracker`: TODO 추적
- `19-branch-strategy`: 브랜치 전략 체크
- `20-api-key-check`: API 키 체크

**전체 목록**: `.claude/hooks/` 디렉토리 참조

---

## 🤖 100개+ Subagents

Subagents는 특화된 AI 전문가들입니다.

### 주요 Subagents

#### 프로젝트 관리
- `project-initializer`: 프로젝트 초기화 전문가
- `architecture-advisor`: 아키텍처 자문가
- `dependency-manager`: 의존성 관리자

#### 코딩
- `code-generator`: 코드 생성 전문가
- `code-reviewer`: 코드 리뷰어
- `refactoring-expert`: 리팩토링 전문가
- `performance-optimizer`: 성능 최적화 전문가

#### 디버깅
- `bug-hunter`: 버그 헌터
- `error-analyst`: 에러 분석가
- `test-master`: 테스트 마스터

#### Git
- `git-wizard`: Git 마법사
- `commit-message-pro`: 커밋 메시지 전문가

#### 데이터베이스
- `database-architect`: DB 아키텍트
- `sql-generator`: SQL 생성기
- `query-optimizer`: 쿼리 최적화 전문가

#### API
- `api-designer`: API 설계자
- `api-documenter`: API 문서 작성자
- `graphql-expert`: GraphQL 전문가

#### 보안
- `security-auditor`: 보안 감사관
- `auth-specialist`: 인증 전문가
- `encryption-expert`: 암호화 전문가

#### DevOps
- `docker-master`: Docker 마스터
- `cicd-engineer`: CI/CD 엔지니어
- `cloud-architect`: 클라우드 아키텍트
- `monitoring-expert`: 모니터링 전문가

#### 프론트엔드
- `react-specialist`: React 전문가
- `css-master`: CSS 마스터
- `ux-designer`: UX 디자이너

#### 데이터 & ML
- `data-scientist`: 데이터 과학자
- `ml-engineer`: ML 엔지니어
- `nlp-specialist`: NLP 전문가
- `cv-expert`: 컴퓨터 비전 전문가

#### 문서화
- `documentation-writer`: 문서 작성자
- `tutorial-creator`: 튜토리얼 제작자

#### 기타
- `code-translator`: 코드 번역가
- `legacy-modernizer`: 레거시 현대화 전문가
- `accessibility-champion`: 접근성 챔피언
- `i18n-specialist`: 국제화 전문가
- `performance-analyst`: 성능 분석가

**전체 목록**: `.claude/subagents/` 디렉토리 참조

---

## 🔄 워크플로우 예제

### 1. 완전히 새로운 프로젝트 시작하기

```
1. /init-project
   → project-initializer 자동 실행
   → Skills #29 참조
   → Hooks: 01, 02, 03 실행

2. /setup-env
   → dependency-manager 자동 실행
   → Skills #34 참조

3. /git-init
   → git-wizard 자동 실행
   → Skills #14 참조

4. 코딩 시작!
```

### 2. 기존 프로젝트에서 작업하기

```
1. /quick-start
   → 프로젝트 상태 분석
   → 다음 단계 제안

2. 기능 추가:
   /add-feature
   → code-generator 실행
   → Skills #1, #24, #25 참조

3. 테스트 작성:
   /write-test
   → test-master 실행
   → Skills #18 참조

4. 커밋:
   /git-commit
   → commit-message-pro 실행
   → Hooks: 10 (pre-commit) 실행
```

### 3. 에러 발생 시

```
1. /fix-error
   → error-analyst 자동 실행
   → Skills #7 참조
   → Hook: 04 (error-detect) 실행

2. /debug
   → bug-hunter 실행
   → Skills #8 참조

3. /write-test
   → 회귀 테스트 작성
```

### 4. 코드 리뷰 및 개선

```
1. /refactor
   → refactoring-expert 실행
   → code-reviewer 실행
   → Skills #6, #9 참조

2. /optimize
   → performance-optimizer 실행
   → Skills #11 참조

3. /security-check
   → security-auditor 실행
   → Skills #35 참조
   → Hook: 15 (security-scan) 실행
```

### 5. 배포하기

```
1. /build
   → 프로젝트 빌드

2. /run-tests
   → 모든 테스트 실행
   → Skills #19, #20 참조

3. /docker
   → docker-master 실행
   → Dockerfile 생성

4. /ci-cd
   → cicd-engineer 실행
   → Skills #16 참조

5. /deploy
   → cloud-architect 실행
   → Skills #66 참조
```

---

## 🎓 비개발자를 위한 완벽 가이드

### Q: 프로그래밍을 전혀 모르는데 괜찮나요?
**A**: 네! 이 시스템은 비개발자를 위해 설계되었습니다.

### Q: 어디서부터 시작해야 하나요?
**A**:
```
1. VSCode를 엽니다
2. /templates 를 입력합니다
3. 만들고 싶은 프로젝트 유형을 선택합니다
4. 시스템이 모든 것을 안내합니다!
```

### Q: 에러가 무섭습니다
**A**:
```
에러가 발생하면:
1. 전체 에러 메시지를 복사합니다
2. /fix-error 를 입력합니다
3. error-analyst가 자동으로 해결해줍니다!

Hooks가 위험한 작업을 자동으로 막아줍니다.
```

### Q: Git이 뭔가요?
**A**:
```
코드 버전 관리 시스템입니다.
걱정하지 마세요:

1. /git-init 으로 시작
2. /git-commit 으로 저장
3. git-wizard가 모든 것을 안내합니다

복잡한 명령어는 몰라도 됩니다!
```

### Q: 테스트를 작성해야 하나요?
**A**:
```
네, 하지만 쉽습니다:

1. /write-test 입력
2. 테스트할 함수를 알려줍니다
3. test-master가 자동으로 작성합니다

테스트는 코드가 제대로 작동하는지 확인하는 것입니다.
```

### Q: 어떤 기술을 배워야 하나요?
**A**:
```
배우지 마세요!

이 시스템을 사용하세요:
- Skills가 지식을 제공합니다
- Commands가 작업을 수행합니다
- Hooks가 실수를 방지합니다
- Subagents가 전문가처럼 도와줍니다

만들면서 자연스럽게 배울 수 있습니다.
```

---

## 🚨 문제 해결

### 에러 메시지가 나타날 때
```
/fix-error
```

### 코드가 작동하지 않을 때
```
/debug
```

### Git 충돌이 발생했을 때
```
/git-conflict
```

### 테스트가 실패할 때
```
/run-tests
→ 실패 원인 분석
→ 자동 수정 제안
```

### 보안 경고가 나타날 때
```
/security-check
/security-audit
```

### 성능이 느릴 때
```
/optimize
/analyze-performance
```

---

## 📊 통합 아키텍처

```
비개발자 입력
    ↓
Commands (/명령어)
    ↓
Subagents (전문가 AI)
    ↓
Skills (지식 참조)
    ↓
Hooks (자동 검증/보호)
    ↓
결과 생성
```

### 예시 흐름: "/init-project" 입력 시

```
1. Command: init-project
   → 사용자 요청 파싱

2. Subagent: project-initializer
   → 프로젝트 유형 질문
   → 초기화 전략 수립

3. Skills: #29 (프로젝트 초기화)
   → 베스트 프랙티스 참조
   → 템플릿 선택

4. Hooks:
   → 02-session-start-project-check: 기존 프로젝트 확인
   → 06-before-write-backup: 파일 생성 전 백업
   → 07-after-write-validation: 생성된 파일 검증

5. 결과:
   → 완벽한 프로젝트 구조
   → Git 초기화
   → 의존성 설정
   → README 생성
```

---

## 🌟 주요 특징

### 1. **완전 자동화**
- 반복 작업 자동화
- 보일러플레이트 자동 생성
- 문서 자동 작성

### 2. **실수 방지**
- 위험한 명령어 차단
- 민감 정보 노출 방지
- 보안 취약점 자동 스캔

### 3. **학습 지원**
- 각 단계 설명
- 왜 그렇게 하는지 교육
- 베스트 프랙티스 제안

### 4. **전문가 수준 결과**
- 100개 Skills
- 100개 Commands
- 100개 Hooks
- 100개+ Subagents

---

## 📚 추가 리소스

### 디렉토리 구조
```
.claude/
├── skills/           # 100개 지식 모듈
├── commands/         # 100개 실행 명령
├── hooks/            # 100개 자동화 훅
├── subagents/        # 100개+ 전문가 AI
└── MASTER_GUIDE.md   # 이 파일
```

### 도움말
```
/quick-start          # 빠른 시작
/templates            # 프로젝트 템플릿
"도와줘"               # 일반 도움말
"help"                # 영어 도움말
```

---

## 🎉 시작하기

### 첫 번째 프로젝트 만들기

```bash
# 1. 템플릿 보기
/templates

# 2. 프로젝트 초기화
/init-project

# 3. 환경 설정
/setup-env

# 4. Git 초기화
/git-init

# 5. 첫 번째 기능 추가
/add-feature

# 6. 테스트 작성
/write-test

# 7. 커밋
/git-commit

# 8. 배포
/deploy
```

---

## 💪 당신은 이제 준비되었습니다!

이 시스템으로:
- ✅ 프로젝트를 시작할 수 있습니다
- ✅ 코드를 작성할 수 있습니다
- ✅ 에러를 해결할 수 있습니다
- ✅ 테스트를 작성할 수 있습니다
- ✅ Git을 사용할 수 있습니다
- ✅ 배포할 수 있습니다
- ✅ **세계 최고의 개발자처럼 작업할 수 있습니다!**

---

**시작할 준비가 되셨나요? `/init-project` 를 입력하세요!** 🚀

---

*이 시스템은 비개발자도 전문 개발자 수준의 작업을 수행할 수 있도록 설계되었습니다.*
*질문이 있으면 언제든지 물어보세요!*
