---
description: 3D 시각화
---

3차원 데이터를 3D 차트로 시각화합니다.

## 사용법

```
/viz-3d --data xyz_data.csv --x col1 --y col2 --z col3
```

## 실행 코드

```python
import plotly.graph_objects as go
import pandas as pd

df = pd.read_csv('xyz_data.csv')

fig = go.Figure(data=[go.Scatter3d(
    x=df['x'],
    y=df['y'],
    z=df['z'],
    mode='markers',
    marker=dict(
        size=5,
        color=df['z'],
        colorscale='Viridis',
        showscale=True
    )
)])

fig.update_layout(
    title='3D Scatter Plot',
    scene=dict(
        xaxis_title='X',
        yaxis_title='Y',
        zaxis_title='Z'
    )
)

fig.write_html('3d_plot.html')
print("✅ 3D 차트 저장: 3d_plot.html")
```

