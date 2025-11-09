# 히트맵 (Heatmap)

**카테고리**: Matplotlib 기초

2D 데이터를 색상으로 표현하는 히트맵입니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt
import numpy as np

# 데이터 생성 (예: 상관관계 행렬)
data = np.random.rand(10, 10)

# 히트맵
fig, ax = plt.subplots(figsize=(10, 8))
im = ax.imshow(data, cmap='YlOrRd', aspect='auto')

# 축 레이블
ax.set_xticks(np.arange(10))
ax.set_yticks(np.arange(10))
ax.set_xticklabels([f'Feature {i+1}' for i in range(10)])
ax.set_yticklabels([f'Feature {i+1}' for i in range(10)])

# 회전
plt.setp(ax.get_xticklabels(), rotation=45, ha="right", rotation_mode="anchor")

# 값 표시
for i in range(10):
    for j in range(10):
        text = ax.text(j, i, f'{data[i, j]:.2f}',
                      ha="center", va="center", color="black", fontsize=8)

ax.set_title("히트맵 (Heatmap)", fontsize=16)
fig.colorbar(im, ax=ax, label='Value')

plt.tight_layout()
plt.savefig('heatmap.png', dpi=300)
plt.show()

print("히트맵 저장 완료!")
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
