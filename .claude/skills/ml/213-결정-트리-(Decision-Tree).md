# 결정 트리 (Decision Tree)

**카테고리**: 분류

해석하기 쉬운 트리 기반 모델입니다.

## 💻 실행 가능한 코드

```python
from sklearn.tree import DecisionTreeClassifier, plot_tree, export_text
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt

# 결정 트리 모델
dt_clf = DecisionTreeClassifier(
    max_depth=5,
    min_samples_split=10,
    min_samples_leaf=5,
    random_state=42
)

dt_clf.fit(X_train, y_train)
y_pred = dt_clf.predict(X_test)

print(f"정확도: {accuracy_score(y_test, y_pred):.4f}")

# 트리 시각화
plt.figure(figsize=(20, 10))
plot_tree(dt_clf, filled=True, feature_names=X.columns, class_names=['0', '1'], fontsize=10)
plt.savefig('decision_tree.png', dpi=100, bbox_inches='tight')
print("결정 트리 시각화 저장 완료!")

# 텍스트로 규칙 출력
tree_rules = export_text(dt_clf, feature_names=list(X.columns))
print("\n결정 규칙:")
print(tree_rules[:500])  # 처음 500자만 출력
```

## 📦 필요한 라이브러리

```bash
pip install scikit-learn matplotlib
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

- 다른 분류 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
