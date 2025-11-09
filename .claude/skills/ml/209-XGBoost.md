# XGBoost

**카테고리**: 앙상블

XGBoost로 최고 성능의 그래디언트 부스팅 모델을 만듭니다.

## 💻 실행 가능한 코드

```python
import xgboost as xgb
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, mean_squared_error
import numpy as np

# 분류 모델
xgb_clf = xgb.XGBClassifier(
    n_estimators=100,
    max_depth=6,
    learning_rate=0.1,
    subsample=0.8,
    colsample_bytree=0.8,
    random_state=42,
    use_label_encoder=False,
    eval_metric='logloss'
)

# 학습 (조기 종료 포함)
eval_set = [(X_test, y_test)]
xgb_clf.fit(
    X_train, y_train,
    eval_set=eval_set,
    early_stopping_rounds=10,
    verbose=False
)

# 예측
y_pred = xgb_clf.predict(X_test)

# 평가
print(f"정확도: {accuracy_score(y_test, y_pred):.4f}")

# 특성 중요도
xgb.plot_importance(xgb_clf, max_num_features=10)
plt.show()

# 회귀 모델
xgb_reg = xgb.XGBRegressor(
    n_estimators=100,
    max_depth=6,
    learning_rate=0.1,
    random_state=42
)
```

## 📦 필요한 라이브러리

```bash
pip install xgboost scikit-learn numpy matplotlib
```

## 🎯 사용 예시

1. 위 코드를 복사합니다
2. 데이터를 준비합니다
3. 코드를 실행합니다
4. 결과를 확인합니다

## 💡 팁

- 데이터에 맞게 파라미터를 조정하세요
- 결과를 시각화하여 확인하세요
- 다양한 설정을 실험해보세요

## 📚 관련 Skills

- 다른 앙상블 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
