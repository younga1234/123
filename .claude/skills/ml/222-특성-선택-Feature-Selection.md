# 특성 선택 (Feature Selection)

**카테고리**: 특성 엔지니어링

중요한 특성만 선택합니다.

## 💻 실행 가능한 코드

```python
from sklearn.feature_selection import SelectKBest, f_classif, RFE
from sklearn.ensemble import RandomForestClassifier

# SelectKBest
selector = SelectKBest(f_classif, k=10)
X_selected = selector.fit_transform(X, y)

# RFE (Recursive Feature Elimination)
rf = RandomForestClassifier()
rfe = RFE(rf, n_features_to_select=10)
X_rfe = rfe.fit_transform(X, y)
print(f"선택된 특성: {rfe.support_}")
```

## 📦 필요한 라이브러리

```bash
pip install scikit-learn
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

- 다른 특성 엔지니어링 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
