# Seaborn 산점도 (Pairplot)

**카테고리**: Seaborn

여러 변수 간의 관계를 한번에 보는 pairplot입니다.

## 💻 실행 가능한 코드

```python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# 샘플 데이터 생성
n = 200
df = pd.DataFrame({
    'feature1': np.random.randn(n),
    'feature2': np.random.randn(n),
    'feature3': np.random.randn(n),
    'category': np.random.choice(['A', 'B', 'C'], n)
})

# Pairplot
sns.pairplot(df, hue='category', palette='Set2',
             diag_kind='kde', plot_kws={'alpha': 0.6})

plt.suptitle('Pairplot - 변수 간 관계', y=1.02, fontsize=16)
plt.tight_layout()
plt.savefig('pairplot.png', dpi=300)
plt.show()

print("Pairplot 저장 완료!")
```

## 📦 필요한 라이브러리

```bash
pip install seaborn matplotlib pandas numpy
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

- 다른 Seaborn Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
