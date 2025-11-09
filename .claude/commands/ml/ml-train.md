---
description: 자동으로 최적의 모델 선택 및 학습
---

데이터를 분석하고 자동으로 최적의 ML 모델을 선택해서 학습합니다.

## 사용법

```
/ml-train
```

또는

```
/ml-train --data train.csv --target sales --auto
```

## 작동 방식

1. **데이터 분석**
   - 데이터 타입 확인 (분류 vs 회귀)
   - 데이터 크기 분석
   - 특성 개수 파악

2. **자동 모델 선택**
   - 소규모 데이터 → Random Forest
   - 대규모 데이터 → XGBoost
   - 선형 관계 → Linear/Logistic Regression
   - 비선형 관계 → Ensemble 모델

3. **전처리 및 학습**
   - 자동 전처리 (결측치, 인코딩, 스케일링)
   - 5-Fold Cross Validation
   - 최적 모델 학습

4. **결과 출력**
   - 모델 성능 비교 표
   - 최종 모델 저장
   - 평가 리포트 생성

## 실행 코드

```python
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor
from sklearn.linear_model import LogisticRegression, LinearRegression
from sklearn.model_selection import cross_val_score
import xgboost as xgb

print("🤖 자동 ML 학습 시작...")

# 데이터 로딩
df = pd.read_csv('data.csv')

# 문제 타입 자동 판별
is_classification = len(df['target'].unique()) < 20

# 모델 후보
if is_classification:
    models = {
        'Random Forest': RandomForestClassifier(),
        'XGBoost': xgb.XGBClassifier(),
        'Logistic Regression': LogisticRegression(max_iter=1000)
    }
else:
    models = {
        'Random Forest': RandomForestRegressor(),
        'XGBoost': xgb.XGBRegressor(),
        'Linear Regression': LinearRegression()
    }

# 각 모델 평가
print("\n📊 모델 평가 중...")
results = {}
for name, model in models.items():
    scores = cross_val_score(model, X, y, cv=5)
    results[name] = scores.mean()
    print(f"   {name}: {scores.mean():.4f} (+/- {scores.std():.4f})")

# 최적 모델 선택
best_model_name = max(results, key=results.get)
print(f"\n🏆 최적 모델: {best_model_name} (점수: {results[best_model_name]:.4f})")

# 최종 학습
best_model = models[best_model_name]
best_model.fit(X, y)

print("\n✅ 학습 완료!")
```

## 관련 Commands

- `/ml-xgboost` - XGBoost 전용 학습
- `/ml-evaluate` - 모델 평가
- `/ml-compare` - 모델 비교

