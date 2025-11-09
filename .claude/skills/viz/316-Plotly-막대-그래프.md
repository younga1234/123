# Plotly 막대 그래프

**카테고리**: Plotly

인터랙티브 막대 그래프입니다.

## 💻 실행 가능한 코드

```python
import plotly.graph_objects as go

fig = go.Figure(data=[
    go.Bar(name='2023', x=['A', 'B', 'C'], y=[20, 14, 23]),
    go.Bar(name='2024', x=['A', 'B', 'C'], y=[12, 18, 29])
])

fig.update_layout(barmode='group', title='연도별 비교')
fig.write_html('interactive_bar.html')
fig.show()
```

## 📦 필요한 라이브러리

```bash
pip install plotly
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

- 다른 Plotly Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
