---
description: 빠른 차트 생성
---

데이터를 자동으로 분석해서 최적의 차트를 생성합니다.

## 사용법

### 자동 차트 생성
```
/viz-plot --data sales.csv
```

### 특정 차트 타입
```
/viz-plot --data sales.csv --type line --x date --y sales
```

## 지원 차트 타입

- `line` - 선 그래프
- `bar` - 막대 그래프
- `scatter` - 산점도
- `histogram` - 히스토그램
- `box` - 박스 플롯
- `heatmap` - 히트맵
- `pie` - 파이 차트

## 자동 실행 코드

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

print("📊 차트 생성 중...")

# 데이터 로딩
df = pd.read_csv('sales.csv')

# 자동 차트 타입 선택
numeric_cols = df.select_dtypes(include=['number']).columns

if len(numeric_cols) >= 2:
    # 산점도 또는 선 그래프
    plt.figure(figsize=(10, 6))
    plt.plot(df[numeric_cols[0]], df[numeric_cols[1]])
    plt.xlabel(numeric_cols[0])
    plt.ylabel(numeric_cols[1])
elif len(numeric_cols) == 1:
    # 히스토그램
    plt.figure(figsize=(10, 6))
    plt.hist(df[numeric_cols[0]], bins=30)
    plt.xlabel(numeric_cols[0])
    plt.ylabel('Frequency')

plt.title('Auto-generated Chart')
plt.tight_layout()
plt.savefig('chart.png', dpi=300)
print("✅ 차트 저장: chart.png")
plt.show()
```

## 예제

### 시계열 데이터
```
/viz-plot --data stock.csv --type line --x date --y price
```

### 카테고리 비교
```
/viz-plot --data sales.csv --type bar --x category --y amount
```

### 상관관계 분석
```
/viz-plot --data features.csv --type heatmap
```

## 생성 파일

- `chart.png` - 고해상도 차트 (300 DPI)
- `chart.html` - 인터랙티브 버전 (Plotly)

---
*한 줄로 완성하는 데이터 시각화!* 📊

