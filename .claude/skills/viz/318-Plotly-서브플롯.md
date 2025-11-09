# Plotly 서브플롯

**카테고리**: Plotly

여러 차트를 한 화면에 배치합니다.

## 💻 실행 가능한 코드

```python
from plotly.subplots import make_subplots
import plotly.graph_objects as go

fig = make_subplots(rows=2, cols=2,
                    subplot_titles=('Plot 1', 'Plot 2', 'Plot 3', 'Plot 4'))

fig.add_trace(go.Scatter(x=[1, 2, 3], y=[4, 5, 6]), row=1, col=1)
fig.add_trace(go.Bar(x=[1, 2, 3], y=[2, 3, 4]), row=1, col=2)
fig.add_trace(go.Scatter(x=[1, 2, 3], y=[6, 5, 4]), row=2, col=1)
fig.add_trace(go.Box(y=[1, 2, 3, 4, 5, 6]), row=2, col=2)

fig.update_layout(title_text="서브플롯 레이아웃")
fig.write_html('subplots.html')
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
