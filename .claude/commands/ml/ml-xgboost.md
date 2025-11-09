---
description: XGBoost 모델 빠른 학습 및 평가
---

XGBoost 모델을 빠르게 학습하고 평가합니다.

## 사용법

### 기본 사용
```
/ml-xgboost
```

### 옵션 지정
```
/ml-xgboost --data train.csv --target price --test-size 0.2
```

## 작동 방식

이 명령을 실행하면 다음이 자동으로 수행됩니다:

1. **데이터 로딩**
   - CSV 파일 자동 탐지
   - 또는 지정된 데이터 파일 로딩

2. **자동 전처리**
   - 결측치 처리 (평균값 대체)
   - 범주형 변수 인코딩
   - 데이터 분할 (Train/Test)

3. **XGBoost 모델 학습**
   - 최적 파라미터 자동 설정
   - 학습 진행

4. **평가 및 결과**
   - 정확도/RMSE 출력
   - Feature Importance 시각화
   - 모델 저장 (`xgb_model.json`)

## 생성되는 파일

- `xgb_model.json` - 학습된 모델
- `feature_importance.png` - 특성 중요도 차트
- `training_log.txt` - 학습 로그

## 실행 예제

### 예제 1: 기본 실행
```python
# 현재 디렉토리의 data.csv를 자동으로 찾아서 학습
/ml-xgboost
```

**출력:**
```
🔍 데이터 로딩 중...
   ✅ data.csv 발견 (1000 rows, 10 columns)

🔧 전처리 중...
   ✅ 결측치 처리 완료
   ✅ 범주형 변수 인코딩 완료

🚀 XGBoost 학습 중...
   Epoch 1/100 - Loss: 0.523
   Epoch 50/100 - Loss: 0.145
   Epoch 100/100 - Loss: 0.089
   ✅ 학습 완료!

📊 평가 결과:
   정확도: 94.5%
   RMSE: 0.089

💾 모델 저장: xgb_model.json
📈 차트 저장: feature_importance.png

🎉 XGBoost 학습 완료!
```

### 예제 2: 옵션 지정
```python
/ml-xgboost --data housing.csv --target price --n-estimators 200
```

### 예제 3: 회귀 문제
```python
/ml-xgboost --task regression --target sales
```

## 파라미터

- `--data <file>` - 데이터 파일 경로
- `--target <column>` - 목표 변수 (예측할 값)
- `--task <type>` - 'classification' 또는 'regression'
- `--test-size <float>` - 테스트 데이터 비율 (기본: 0.2)
- `--n-estimators <int>` - 트리 개수 (기본: 100)
- `--max-depth <int>` - 최대 깊이 (기본: 6)
- `--learning-rate <float>` - 학습률 (기본: 0.1)

## 자동 실행 코드

```python
import xgboost as xgb
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score, mean_squared_error
import matplotlib.pyplot as plt
import numpy as np

# 데이터 로딩
print("🔍 데이터 로딩 중...")
df = pd.read_csv('data.csv')
print(f"   ✅ 데이터 로드 완료 ({len(df)} rows, {len(df.columns)} columns)")

# 타겟 분리
target_col = 'target'  # 또는 사용자 지정
X = df.drop(target_col, axis=1)
y = df[target_col]

# 전처리
print("🔧 전처리 중...")

# 결측치 처리
X = X.fillna(X.mean(numeric_only=True))
print("   ✅ 결측치 처리 완료")

# 범주형 변수 인코딩
for col in X.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    X[col] = le.fit_transform(X[col].astype(str))
print("   ✅ 범주형 변수 인코딩 완료")

# 데이터 분할
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# XGBoost 모델 학습
print("🚀 XGBoost 학습 중...")

# 분류 vs 회귀 자동 판별
is_classification = len(y.unique()) < 20

if is_classification:
    model = xgb.XGBClassifier(
        n_estimators=100,
        max_depth=6,
        learning_rate=0.1,
        random_state=42,
        use_label_encoder=False,
        eval_metric='logloss'
    )
else:
    model = xgb.XGBRegressor(
        n_estimators=100,
        max_depth=6,
        learning_rate=0.1,
        random_state=42
    )

# 학습
model.fit(
    X_train, y_train,
    eval_set=[(X_test, y_test)],
    early_stopping_rounds=10,
    verbose=True
)

print("   ✅ 학습 완료!")

# 예측
y_pred = model.predict(X_test)

# 평가
print("\n📊 평가 결과:")
if is_classification:
    acc = accuracy_score(y_test, y_pred)
    print(f"   정확도: {acc:.1%}")
else:
    rmse = np.sqrt(mean_squared_error(y_test, y_pred))
    print(f"   RMSE: {rmse:.4f}")

# 특성 중요도 시각화
importance = model.feature_importances_
features = X.columns

plt.figure(figsize=(10, 6))
plt.barh(features, importance)
plt.xlabel('Importance')
plt.title('Feature Importance')
plt.tight_layout()
plt.savefig('feature_importance.png', dpi=300)
print("\n📈 차트 저장: feature_importance.png")

# 모델 저장
model.save_model('xgb_model.json')
print("💾 모델 저장: xgb_model.json")

print("\n🎉 XGBoost 학습 완료!")
```

## 관련 Skills

- Skill 209: XGBoost 상세 가이드
- Skill 202: 결측치 처리
- Skill 205: 범주형 데이터 인코딩
- Skill 227: Grid Search (하이퍼파라미터 튜닝)

## 다음 단계

학습 후 다음을 시도해보세요:

1. **하이퍼파라미터 튜닝**
   ```
   /ml-grid-search --model xgboost
   ```

2. **모델 평가**
   ```
   /ml-evaluate --model xgb_model.json
   ```

3. **예측 실행**
   ```
   /ml-predict --model xgb_model.json --data new_data.csv
   ```

---
*한 줄 명령으로 XGBoost 마스터!* 🚀

