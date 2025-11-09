---
description: 모델 성능 평가 및 리포트 생성
---

학습된 모델의 성능을 평가하고 상세 리포트를 생성합니다.

## 사용법

```
/ml-evaluate --model xgb_model.json --test-data test.csv
```

## 생성되는 리포트

- 📊 Confusion Matrix
- 📈 ROC Curve
- 📉 Learning Curve
- 📋 Classification Report
- 💾 evaluation_report.html

