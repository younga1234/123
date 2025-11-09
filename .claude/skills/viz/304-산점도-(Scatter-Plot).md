# 산점도 (Scatter Plot)

**카테고리**: Matplotlib 기초

두 변수 간의 관계를 보여주는 산점도입니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt
import numpy as np

# 데이터 생성
n = 200
x = np.random.randn(n)
y = 2 * x + np.random.randn(n) * 0.5
colors = np.random.rand(n)
sizes = 1000 * np.random.rand(n)

# 산점도
plt.figure(figsize=(10, 6))
scatter = plt.scatter(x, y, c=colors, s=sizes, alpha=0.6,
                     cmap='viridis', edgecolors='black', linewidth=0.5)

plt.colorbar(scatter, label='Color Value')
plt.title('산점도 (Scatter Plot)', fontsize=16)
plt.xlabel('X 변수', fontsize=12)
plt.ylabel('Y 변수', fontsize=12)
plt.grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig('scatter_plot.png', dpi=300)
plt.show()

print("산점도 저장 완료!")
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
