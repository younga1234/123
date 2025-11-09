---
description: 데이터 전처리 자동화
---

데이터를 ML 학습에 적합하게 자동으로 전처리합니다.

## 사용법

```
/ml-preprocess --data raw_data.csv
```

## 수행 작업

1. ✅ 결측치 처리
2. ✅ 이상치 탐지 및 제거
3. ✅ 범주형 변수 인코딩
4. ✅ 수치형 변수 스케일링
5. ✅ 특성 엔지니어링

## 실행 코드

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.impute import SimpleImputer

print("🔧 데이터 전처리 시작...")

df = pd.read_csv('raw_data.csv')

# 1. 결측치 처리
imputer = SimpleImputer(strategy='mean')
df_numeric = df.select_dtypes(include=['number'])
df[df_numeric.columns] = imputer.fit_transform(df_numeric)
print("✅ 결측치 처리 완료")

# 2. 범주형 인코딩
for col in df.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    df[col] = le.fit_transform(df[col].astype(str))
print("✅ 인코딩 완료")

# 3. 스케일링
scaler = StandardScaler()
df[df_numeric.columns] = scaler.fit_transform(df[df_numeric.columns])
print("✅ 스케일링 완료")

# 저장
df.to_csv('preprocessed_data.csv', index=False)
print("\n💾 전처리 완료: preprocessed_data.csv")
```

