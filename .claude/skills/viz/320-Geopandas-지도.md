# Geopandas 지도

**카테고리**: 지도 시각화

지리 데이터를 시각화합니다.

## 💻 실행 가능한 코드

```python
import geopandas as gpd
import matplotlib.pyplot as plt

# 샘플 데이터 로드
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))

# 시각화
fig, ax = plt.subplots(figsize=(15, 10))
world.plot(column='pop_est', ax=ax, legend=True, cmap='YlOrRd')
plt.title('World Population')
plt.savefig('world_map.png')
```

## 📦 필요한 라이브러리

```bash
pip install geopandas matplotlib
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

- 다른 지도 시각화 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
