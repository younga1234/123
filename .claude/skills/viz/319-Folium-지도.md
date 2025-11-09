# Folium 지도

**카테고리**: 지도 시각화

인터랙티브 지도를 생성합니다.

## 💻 실행 가능한 코드

```python
import folium

# 서울 지도 생성
m = folium.Map(location=[37.5665, 126.9780], zoom_start=12)

# 마커 추가
folium.Marker([37.5665, 126.9780], popup='서울시청', tooltip='Click me!').add_to(m)

m.save('map.html')
print("지도 저장 완료: map.html")
```

## 📦 필요한 라이브러리

```bash
pip install folium
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
