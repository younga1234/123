# 히스토그램 (Histogram)

**카테고리**: Matplotlib 기초

데이터의 분포를 보여주는 히스토그램입니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt
import numpy as np

# 정규분포 데이터 생성
data1 = np.random.normal(100, 15, 1000)
data2 = np.random.normal(130, 20, 1000)

# 히스토그램
plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.hist(data1, bins=30, color='steelblue', edgecolor='black', alpha=0.7)
plt.title('히스토그램 - 기본', fontsize=14)
plt.xlabel('값')
plt.ylabel('빈도')
plt.grid(axis='y', alpha=0.3)

plt.subplot(1, 2, 2)
plt.hist([data1, data2], bins=30, label=['Data 1', 'Data 2'],
         color=['steelblue', 'coral'], alpha=0.6)
plt.title('히스토그램 - 비교', fontsize=14)
plt.xlabel('값')
plt.ylabel('빈도')
plt.legend()
plt.grid(axis='y', alpha=0.3)

plt.tight_layout()
plt.savefig('histogram.png', dpi=300)
plt.show()

print("히스토그램 저장 완료!")
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
