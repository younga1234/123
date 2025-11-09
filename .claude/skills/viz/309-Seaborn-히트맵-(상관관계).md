# Seaborn 히트맵 (상관관계)

**카테고리**: Seaborn

상관관계 행렬을 시각화하는 히트맵입니다.

## 💻 실행 가능한 코드

```python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# 샘플 데이터
n = 100
df = pd.DataFrame({
    'A': np.random.randn(n),
    'B': np.random.randn(n),
    'C': np.random.randn(n),
    'D': np.random.randn(n),
    'E': np.random.randn(n)
})

# 상관관계 계산
corr = df.corr()

# 히트맵
plt.figure(figsize=(10, 8))
sns.heatmap(corr, annot=True, cmap='coolwarm', center=0,
            square=True, linewidths=1, cbar_kws={"shrink": 0.8},
            fmt='.2f', vmin=-1, vmax=1)

plt.title('상관관계 히트맵', fontsize=16)
plt.tight_layout()
plt.savefig('correlation_heatmap.png', dpi=300)
plt.show()

print("상관관계 히트맵 저장 완료!")
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
