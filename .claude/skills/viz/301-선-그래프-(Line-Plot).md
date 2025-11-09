# 선 그래프 (Line Plot)

**카테고리**: Matplotlib 기초

시간에 따른 변화를 보여주는 선 그래프를 그립니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt
import numpy as np

# 데이터 준비
x = np.linspace(0, 10, 100)
y1 = np.sin(x)
y2 = np.cos(x)

# 그래프 생성
plt.figure(figsize=(10, 6))
plt.plot(x, y1, label='sin(x)', linewidth=2, color='blue', linestyle='-')
plt.plot(x, y2, label='cos(x)', linewidth=2, color='red', linestyle='--')

plt.title('사인과 코사인 함수', fontsize=16)
plt.xlabel('X축', fontsize=12)
plt.ylabel('Y축', fontsize=12)
plt.legend(fontsize=10)
plt.grid(True, alpha=0.3)
plt.tight_layout()

plt.savefig('line_plot.png', dpi=300, bbox_inches='tight')
plt.show()

print("선 그래프 저장 완료!")
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
