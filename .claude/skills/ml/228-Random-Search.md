# Random Search

**카테고리**: 모델 튜닝

랜덤하게 하이퍼파라미터를 탐색합니다.

## 💻 실행 가능한 코드

```python
from sklearn.model_selection import RandomizedSearchCV
from scipy.stats import randint, uniform

param_dist = {
    'n_estimators': randint(50, 200),
    'max_depth': randint(5, 20),
    'learning_rate': uniform(0.01, 0.3)
}

random_search = RandomizedSearchCV(model, param_dist, n_iter=20, cv=5, n_jobs=-1)
random_search.fit(X_train, y_train)
print(f"최적 파라미터: {random_search.best_params_}")
```

## 📦 필요한 라이브러리

```bash
pip install scikit-learn scipy
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

- 다른 모델 튜닝 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
