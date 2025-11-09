# 막대 그래프 (Bar Chart)

**카테고리**: Matplotlib 기초

카테고리별 비교를 위한 막대 그래프입니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt
import numpy as np

# 데이터
categories = ['A', 'B', 'C', 'D', 'E']
values = [23, 45, 56, 78, 32]

# 수평/수직 막대 그래프
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))

# 수직 막대
ax1.bar(categories, values, color='skyblue', edgecolor='navy', alpha=0.7)
ax1.set_title('수직 막대 그래프', fontsize=14)
ax1.set_xlabel('카테고리')
ax1.set_ylabel('값')
ax1.grid(axis='y', alpha=0.3)

# 수평 막대
ax2.barh(categories, values, color='lightcoral', edgecolor='darkred', alpha=0.7)
ax2.set_title('수평 막대 그래프', fontsize=14)
ax2.set_xlabel('값')
ax2.set_ylabel('카테고리')
ax2.grid(axis='x', alpha=0.3)

plt.tight_layout()
plt.savefig('bar_chart.png', dpi=300)
plt.show()

print("막대 그래프 저장 완료!")
```

## 📦 필요한 라이브러리

```bash
pip install matplotlib numpy
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

- 다른 Matplotlib 기초 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
