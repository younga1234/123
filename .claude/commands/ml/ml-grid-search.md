---
description: 하이퍼파라미터 자동 튜닝
---

Grid Search로 최적의 하이퍼파라미터를 찾습니다.

## 사용법

```
/ml-grid-search --model xgboost --data train.csv
```

## 탐색 파라미터

XGBoost:
- n_estimators: [50, 100, 200]
- max_depth: [3, 5, 7, 10]
- learning_rate: [0.01, 0.05, 0.1, 0.3]

Random Forest:
- n_estimators: [50, 100, 200]
- max_depth: [10, 20, 30, None]
- min_samples_split: [2, 5, 10]

