# RNN & LSTM (순환 신경망)

**카테고리**: 딥러닝

시계열 데이터와 텍스트 처리를 위한 RNN/LSTM입니다.

## 💻 실행 가능한 코드

```python
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# 시계열 데이터 준비 함수
def create_sequences(data, seq_length):
    X, y = [], []
    for i in range(len(data) - seq_length):
        X.append(data[i:i+seq_length])
        y.append(data[i+seq_length])
    return np.array(X), np.array(y)

# LSTM 모델
model = keras.Sequential([
    layers.LSTM(64, return_sequences=True, input_shape=(seq_length, n_features)),
    layers.Dropout(0.2),
    layers.LSTM(32),
    layers.Dropout(0.2),
    layers.Dense(16, activation='relu'),
    layers.Dense(1)
])

model.compile(
    optimizer='adam',
    loss='mse',
    metrics=['mae']
)

print(model.summary())

# Bidirectional LSTM (양방향)
bi_lstm_model = keras.Sequential([
    layers.Bidirectional(layers.LSTM(64, return_sequences=True),
                        input_shape=(seq_length, n_features)),
    layers.Dropout(0.2),
    layers.Bidirectional(layers.LSTM(32)),
    layers.Dropout(0.2),
    layers.Dense(1)
])

# GRU (LSTM의 경량 버전)
gru_model = keras.Sequential([
    layers.GRU(64, return_sequences=True, input_shape=(seq_length, n_features)),
    layers.Dropout(0.2),
    layers.GRU(32),
    layers.Dense(1)
])
```

## 📦 필요한 라이브러리

```bash
pip install tensorflow numpy
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

- 다른 딥러닝 Skills 참고
- 데이터 전처리 Skills
- 모델 평가 Skills

---
*바로 실행 가능한 실전 코드입니다!*
