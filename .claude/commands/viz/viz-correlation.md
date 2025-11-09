---
description: 상관관계 분석 및 시각화
---

데이터의 모든 변수 간 상관관계를 분석하고 히트맵으로 시각화합니다.

## 사용법

```
/viz-correlation --data features.csv
```

## 실행 코드

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv('features.csv')
corr = df.corr()

plt.figure(figsize=(12, 10))
sns.heatmap(corr, annot=True, cmap='coolwarm', center=0,
            square=True, linewidths=1, fmt='.2f')
plt.title('Correlation Matrix')
plt.tight_layout()
plt.savefig('correlation.png', dpi=300)
print("✅ 상관관계 히트맵 저장: correlation.png")
```

