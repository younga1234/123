---
description: 학습된 모델로 예측 실행
---

학습된 모델을 사용해서 새로운 데이터에 대한 예측을 실행합니다.

## 사용법

```
/ml-predict --model xgb_model.json --data new_data.csv
```

## 작동 방식

1. 모델 로딩
2. 데이터 전처리 (학습 시와 동일)
3. 예측 실행
4. 결과 저장 (`predictions.csv`)

## 실행 코드

```python
import xgboost as xgb
import pandas as pd

# 모델 로딩
model = xgb.XGBClassifier()
model.load_model('xgb_model.json')

# 데이터 로딩
new_data = pd.read_csv('new_data.csv')

# 예측
predictions = model.predict(new_data)

# 확률값 (분류인 경우)
probabilities = model.predict_proba(new_data)

# 결과 저장
result_df = new_data.copy()
result_df['prediction'] = predictions
result_df['probability'] = probabilities.max(axis=1)
result_df.to_csv('predictions.csv', index=False)

print(f"✅ 예측 완료! {len(predictions)}개 결과 저장")
```

