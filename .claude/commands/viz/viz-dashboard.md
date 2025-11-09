---
description: 인터랙티브 대시보드 생성
---

데이터를 분석해서 인터랙티브 대시보드를 자동 생성합니다.

## 사용법

```
/viz-dashboard --data sales.csv
```

## 생성되는 대시보드

1. **개요 섹션**
   - 주요 지표 (KPI)
   - 요약 통계

2. **시각화 섹션**
   - 시계열 차트
   - 분포 차트
   - 상관관계 히트맵

3. **인터랙티브 필터**
   - 날짜 범위 선택
   - 카테고리 필터
   - 슬라이더

## 실행 코드

```python
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import pandas as pd

print("🎨 대시보드 생성 중...")

df = pd.read_csv('sales.csv')

# 서브플롯 생성
fig = make_subplots(
    rows=2, cols=2,
    subplot_titles=('시계열', '분포', '카테고리별', '상관관계')
)

# 1. 시계열
fig.add_trace(
    go.Scatter(x=df['date'], y=df['sales'], mode='lines'),
    row=1, col=1
)

# 2. 히스토그램
fig.add_trace(
    go.Histogram(x=df['amount']),
    row=1, col=2
)

# 3. 막대 그래프
fig.add_trace(
    go.Bar(x=df['category'], y=df['count']),
    row=2, col=1
)

# 레이아웃
fig.update_layout(
    title_text="Sales Dashboard",
    showlegend=False,
    height=800
)

# 저장
fig.write_html('dashboard.html')
print("✅ 대시보드 저장: dashboard.html")
print("   브라우저에서 열어보세요!")
```

## 생성 파일

- `dashboard.html` - 인터랙티브 대시보드
- 브라우저에서 바로 열기 가능
- 줌, 필터, 호버 인터랙션 지원

## 예제

```
/viz-dashboard --data sales.csv --title "Sales Analytics"
```

**출력:**
```
🎨 대시보드 생성 중...
   ✅ 데이터 로딩 완료 (1000 rows)
   ✅ 4개 차트 생성
   ✅ 인터랙티브 필터 추가
   ✅ 대시보드 저장: dashboard.html

📂 파일 크기: 2.3 MB
🌐 브라우저에서 열기: dashboard.html

🎉 대시보드 생성 완료!
```

