# 파이 차트 (Pie Chart)

**카테고리**: Matplotlib 기초

비율을 보여주는 파이 차트입니다.

## 💻 실행 가능한 코드

```python
import matplotlib.pyplot as plt

# 데이터
labels = ['Python', 'Java', 'JavaScript', 'C++', 'Others']
sizes = [35, 25, 20, 12, 8]
colors = ['#ff9999', '#66b3ff', '#99ff99', '#ffcc99', '#ff99cc']
explode = (0.1, 0, 0, 0, 0)  # 첫 번째 조각 분리

# 파이 차트
plt.figure(figsize=(10, 8))
plt.pie(sizes, explode=explode, labels=labels, colors=colors,
        autopct='%1.1f%%', shadow=True, startangle=90)

plt.title('프로그래밍 언어 사용 비율', fontsize=16)
plt.axis('equal')  # 원형 유지

plt.tight_layout()
plt.savefig('pie_chart.png', dpi=300)
plt.show()

print("파이 차트 저장 완료!")
```

## 📦 필요한 라이브러리

```bash
pip install matplotlib
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
