# Violin Plot

**카테고리**: Seaborn

분포와 확률 밀도를 보여주는 바이올린 플롯입니다.

## 💻 실행 가능한 코드

```python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# 샘플 데이터
n = 300
df = pd.DataFrame({
    'category': np.repeat(['A', 'B', 'C', 'D'], n//4),
    'value': np.concatenate([
        np.random.normal(10, 2, n//4),
        np.random.normal(15, 3, n//4),
        np.random.normal(20, 2.5, n//4),
        np.random.normal(12, 4, n//4)
    ])
})

# Violin Plot
plt.figure(figsize=(12, 6))
sns.violinplot(data=df, x='category', y='value', palette='muted',
               inner='quartile')

plt.title('Violin Plot - 분포 비교', fontsize=16)
plt.xlabel('카테고리', fontsize=12)
plt.ylabel('값', fontsize=12)
plt.grid(axis='y', alpha=0.3)

plt.tight_layout()
plt.savefig('violin_plot.png', dpi=300)
plt.show()

print("Violin Plot 저장 완료!")
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
