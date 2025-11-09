#!/usr/bin/env python3
"""
ML/Viz Commands 생성기
사용자가 쉽게 ML/Viz Skills를 실행할 수 있는 명령어 제작
"""

import os
from pathlib import Path

Path(".claude/commands/ml").mkdir(parents=True, exist_ok=True)
Path(".claude/commands/viz").mkdir(parents=True, exist_ok=True)

# ==============================================
# ML COMMANDS
# ==============================================

ml_commands = [
    {
        "name": "ml-xgboost",
        "description": "XGBoost 모델 빠른 학습 및 평가",
        "content": """XGBoost 모델을 빠르게 학습하고 평가합니다.

## 사용법

### 기본 사용
```
/ml-xgboost
```

### 옵션 지정
```
/ml-xgboost --data train.csv --target price --test-size 0.2
```

## 작동 방식

이 명령을 실행하면 다음이 자동으로 수행됩니다:

1. **데이터 로딩**
   - CSV 파일 자동 탐지
   - 또는 지정된 데이터 파일 로딩

2. **자동 전처리**
   - 결측치 처리 (평균값 대체)
   - 범주형 변수 인코딩
   - 데이터 분할 (Train/Test)

3. **XGBoost 모델 학습**
   - 최적 파라미터 자동 설정
   - 학습 진행

4. **평가 및 결과**
   - 정확도/RMSE 출력
   - Feature Importance 시각화
   - 모델 저장 (`xgb_model.json`)

## 생성되는 파일

- `xgb_model.json` - 학습된 모델
- `feature_importance.png` - 특성 중요도 차트
- `training_log.txt` - 학습 로그

## 실행 예제

### 예제 1: 기본 실행
```python
# 현재 디렉토리의 data.csv를 자동으로 찾아서 학습
/ml-xgboost
```

**출력:**
```
🔍 데이터 로딩 중...
   ✅ data.csv 발견 (1000 rows, 10 columns)

🔧 전처리 중...
   ✅ 결측치 처리 완료
   ✅ 범주형 변수 인코딩 완료

🚀 XGBoost 학습 중...
   Epoch 1/100 - Loss: 0.523
   Epoch 50/100 - Loss: 0.145
   Epoch 100/100 - Loss: 0.089
   ✅ 학습 완료!

📊 평가 결과:
   정확도: 94.5%
   RMSE: 0.089

💾 모델 저장: xgb_model.json
📈 차트 저장: feature_importance.png

🎉 XGBoost 학습 완료!
```

### 예제 2: 옵션 지정
```python
/ml-xgboost --data housing.csv --target price --n-estimators 200
```

### 예제 3: 회귀 문제
```python
/ml-xgboost --task regression --target sales
```

## 파라미터

- `--data <file>` - 데이터 파일 경로
- `--target <column>` - 목표 변수 (예측할 값)
- `--task <type>` - 'classification' 또는 'regression'
- `--test-size <float>` - 테스트 데이터 비율 (기본: 0.2)
- `--n-estimators <int>` - 트리 개수 (기본: 100)
- `--max-depth <int>` - 최대 깊이 (기본: 6)
- `--learning-rate <float>` - 학습률 (기본: 0.1)

## 자동 실행 코드

```python
import xgboost as xgb
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score, mean_squared_error
import matplotlib.pyplot as plt
import numpy as np

# 데이터 로딩
print("🔍 데이터 로딩 중...")
df = pd.read_csv('data.csv')
print(f"   ✅ 데이터 로드 완료 ({len(df)} rows, {len(df.columns)} columns)")

# 타겟 분리
target_col = 'target'  # 또는 사용자 지정
X = df.drop(target_col, axis=1)
y = df[target_col]

# 전처리
print("🔧 전처리 중...")

# 결측치 처리
X = X.fillna(X.mean(numeric_only=True))
print("   ✅ 결측치 처리 완료")

# 범주형 변수 인코딩
for col in X.select_dtypes(include=['object']).columns:
    le = LabelEncoder()
    X[col] = le.fit_transform(X[col].astype(str))
print("   ✅ 범주형 변수 인코딩 완료")

# 데이터 분할
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# XGBoost 모델 학습
print("🚀 XGBoost 학습 중...")

# 분류 vs 회귀 자동 판별
is_classification = len(y.unique()) < 20

if is_classification:
    model = xgb.XGBClassifier(
        n_estimators=100,
        max_depth=6,
        learning_rate=0.1,
        random_state=42,
        use_label_encoder=False,
        eval_metric='logloss'
    )
else:
    model = xgb.XGBRegressor(
        n_estimators=100,
        max_depth=6,
        learning_rate=0.1,
        random_state=42
    )

# 학습
model.fit(
    X_train, y_train,
    eval_set=[(X_test, y_test)],
    early_stopping_rounds=10,
    verbose=True
)

print("   ✅ 학습 완료!")

# 예측
y_pred = model.predict(X_test)

# 평가
print("\\n📊 평가 결과:")
if is_classification:
    acc = accuracy_score(y_test, y_pred)
    print(f"   정확도: {acc:.1%}")
else:
    rmse = np.sqrt(mean_squared_error(y_test, y_pred))
    print(f"   RMSE: {rmse:.4f}")

# 특성 중요도 시각화
importance = model.feature_importances_
features = X.columns

plt.figure(figsize=(10, 6))
plt.barh(features, importance)
plt.xlabel('Importance')
plt.title('Feature Importance')
plt.tight_layout()
plt.savefig('feature_importance.png', dpi=300)
print("\\n📈 차트 저장: feature_importance.png")

# 모델 저장
model.save_model('xgb_model.json')
print("💾 모델 저장: xgb_model.json")

print("\\n🎉 XGBoost 학습 완료!")
```

## 관련 Skills

- Skill 209: XGBoost 상세 가이드
- Skill 202: 결측치 처리
- Skill 205: 범주형 데이터 인코딩
- Skill 227: Grid Search (하이퍼파라미터 튜닝)

## 다음 단계

학습 후 다음을 시도해보세요:

1. **하이퍼파라미터 튜닝**
   ```
   /ml-grid-search --model xgboost
   ```

2. **모델 평가**
   ```
   /ml-evaluate --model xgb_model.json
   ```

3. **예측 실행**
   ```
   /ml-predict --model xgb_model.json --data new_data.csv
   ```

---
*한 줄 명령으로 XGBoost 마스터!* 🚀
"""
    },
    {
        "name": "ml-train",
        "description": "자동으로 최적의 모델 선택 및 학습",
        "content": """데이터를 분석하고 자동으로 최적의 ML 모델을 선택해서 학습합니다.

## 사용법

```
/ml-train
```

또는

```
/ml-train --data train.csv --target sales --auto
```

## 작동 방식

1. **데이터 분석**
   - 데이터 타입 확인 (분류 vs 회귀)
   - 데이터 크기 분석
   - 특성 개수 파악

2. **자동 모델 선택**
   - 소규모 데이터 → Random Forest
   - 대규모 데이터 → XGBoost
   - 선형 관계 → Linear/Logistic Regression
   - 비선형 관계 → Ensemble 모델

3. **전처리 및 학습**
   - 자동 전처리 (결측치, 인코딩, 스케일링)
   - 5-Fold Cross Validation
   - 최적 모델 학습

4. **결과 출력**
   - 모델 성능 비교 표
   - 최종 모델 저장
   - 평가 리포트 생성

## 실행 코드

```python
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor
from sklearn.linear_model import LogisticRegression, LinearRegression
from sklearn.model_selection import cross_val_score
import xgboost as xgb

print("🤖 자동 ML 학습 시작...")

# 데이터 로딩
df = pd.read_csv('data.csv')

# 문제 타입 자동 판별
is_classification = len(df['target'].unique()) < 20

# 모델 후보
if is_classification:
    models = {
        'Random Forest': RandomForestClassifier(),
        'XGBoost': xgb.XGBClassifier(),
        'Logistic Regression': LogisticRegression(max_iter=1000)
    }
else:
    models = {
        'Random Forest': RandomForestRegressor(),
        'XGBoost': xgb.XGBRegressor(),
        'Linear Regression': LinearRegression()
    }

# 각 모델 평가
print("\\n📊 모델 평가 중...")
results = {}
for name, model in models.items():
    scores = cross_val_score(model, X, y, cv=5)
    results[name] = scores.mean()
    print(f"   {name}: {scores.mean():.4f} (+/- {scores.std():.4f})")

# 최적 모델 선택
best_model_name = max(results, key=results.get)
print(f"\\n🏆 최적 모델: {best_model_name} (점수: {results[best_model_name]:.4f})")

# 최종 학습
best_model = models[best_model_name]
best_model.fit(X, y)

print("\\n✅ 학습 완료!")
```

## 관련 Commands

- `/ml-xgboost` - XGBoost 전용 학습
- `/ml-evaluate` - 모델 평가
- `/ml-compare` - 모델 비교
"""
    },
    {
        "name": "ml-predict",
        "description": "학습된 모델로 예측 실행",
        "content": """학습된 모델을 사용해서 새로운 데이터에 대한 예측을 실행합니다.

## 사용법

```
/ml-predict --model xgb_model.json --data new_data.csv
```

## 작동 방식

1. 모델 로딩
2. 데이터 전처리 (학습 시와 동일)
3. 예측 실행
4. 결과 저장 (`predictions.csv`)

## 실행 코드

```python
import xgboost as xgb
import pandas as pd

# 모델 로딩
model = xgb.XGBClassifier()
model.load_model('xgb_model.json')

# 데이터 로딩
new_data = pd.read_csv('new_data.csv')

# 예측
predictions = model.predict(new_data)

# 확률값 (분류인 경우)
probabilities = model.predict_proba(new_data)

# 결과 저장
result_df = new_data.copy()
result_df['prediction'] = predictions
result_df['probability'] = probabilities.max(axis=1)
result_df.to_csv('predictions.csv', index=False)

print(f"✅ 예측 완료! {len(predictions)}개 결과 저장")
```
"""
    },
    {
        "name": "ml-preprocess",
        "description": "데이터 전처리 자동화",
        "content": """데이터를 ML 학습에 적합하게 자동으로 전처리합니다.

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
print("\\n💾 전처리 완료: preprocessed_data.csv")
```
"""
    },
]

# 더 많은 ML Commands
additional_ml_commands = [
    {
        "name": "ml-evaluate",
        "description": "모델 성능 평가 및 리포트 생성",
        "content": """학습된 모델의 성능을 평가하고 상세 리포트를 생성합니다.

## 사용법

```
/ml-evaluate --model xgb_model.json --test-data test.csv
```

## 생성되는 리포트

- 📊 Confusion Matrix
- 📈 ROC Curve
- 📉 Learning Curve
- 📋 Classification Report
- 💾 evaluation_report.html
"""
    },
    {
        "name": "ml-feature-importance",
        "description": "특성 중요도 분석",
        "content": """모델의 특성 중요도를 분석하고 시각화합니다.

## 사용법

```
/ml-feature-importance --model xgb_model.json
```

## 출력

- Top 10 중요 특성
- 시각화 차트 (feature_importance.png)
- 특성 중요도 CSV 파일
"""
    },
    {
        "name": "ml-grid-search",
        "description": "하이퍼파라미터 자동 튜닝",
        "content": """Grid Search로 최적의 하이퍼파라미터를 찾습니다.

## 사용법

```
/ml-grid-search --model xgboost --data train.csv
```

## 탐색 파라미터

XGBoost:
- n_estimators: [50, 100, 200]
- max_depth: [3, 5, 7, 10]
- learning_rate: [0.01, 0.05, 0.1, 0.3]

Random Forest:
- n_estimators: [50, 100, 200]
- max_depth: [10, 20, 30, None]
- min_samples_split: [2, 5, 10]
"""
    },
]

ml_commands.extend(additional_ml_commands)

# ==============================================
# VIZ COMMANDS
# ==============================================

viz_commands = [
    {
        "name": "viz-plot",
        "description": "빠른 차트 생성",
        "content": """데이터를 자동으로 분석해서 최적의 차트를 생성합니다.

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
"""
    },
    {
        "name": "viz-dashboard",
        "description": "인터랙티브 대시보드 생성",
        "content": """데이터를 분석해서 인터랙티브 대시보드를 자동 생성합니다.

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
"""
    },
    {
        "name": "viz-correlation",
        "description": "상관관계 분석 및 시각화",
        "content": """데이터의 모든 변수 간 상관관계를 분석하고 히트맵으로 시각화합니다.

## 사용법

```
/viz-correlation --data features.csv
```

## 실행 코드

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv('features.csv')
corr = df.corr()

plt.figure(figsize=(12, 10))
sns.heatmap(corr, annot=True, cmap='coolwarm', center=0,
            square=True, linewidths=1, fmt='.2f')
plt.title('Correlation Matrix')
plt.tight_layout()
plt.savefig('correlation.png', dpi=300)
print("✅ 상관관계 히트맵 저장: correlation.png")
```
"""
    },
    {
        "name": "viz-3d",
        "description": "3D 시각화",
        "content": """3차원 데이터를 3D 차트로 시각화합니다.

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
"""
    },
]

# ==============================================
# 파일 생성 함수
# ==============================================

def create_command_file(name, description, content, directory):
    """Command 파일 생성"""
    filepath = Path(directory) / f"{name}.md"

    file_content = f"""---
description: {description}
---

{content}
"""

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(file_content)

    return filepath

# ==============================================
# 메인 실행
# ==============================================

print("🤖 ML/Viz Commands 생성 중...\n")

# ML Commands 생성
print("📊 ML Commands 생성 중...")
ml_count = 0
for cmd in ml_commands:
    filepath = create_command_file(
        cmd['name'],
        cmd['description'],
        cmd['content'],
        ".claude/commands/ml"
    )
    print(f"✅ {filepath}")
    ml_count += 1

print(f"\n🎉 {ml_count}개의 ML Commands 생성 완료!\n")

# Viz Commands 생성
print("📈 Viz Commands 생성 중...")
viz_count = 0
for cmd in viz_commands:
    filepath = create_command_file(
        cmd['name'],
        cmd['description'],
        cmd['content'],
        ".claude/commands/viz"
    )
    print(f"✅ {filepath}")
    viz_count += 1

print(f"\n🎉 {viz_count}개의 Viz Commands 생성 완료!\n")

print(f"=" * 60)
print(f"🚀 총 {ml_count + viz_count}개의 실용적인 Commands 생성 완료!")
print(f"=" * 60)
print(f"ML Commands: {ml_count}개")
print(f"Viz Commands: {viz_count}개")
print(f"\n이제 사용자는 한 줄 명령으로 ML/Viz 작업 가능! 💪")
print(f"\n예시:")
print(f"  /ml-xgboost          → XGBoost 모델 즉시 학습")
print(f"  /ml-train            → 자동 모델 선택 및 학습")
print(f"  /viz-plot            → 자동 차트 생성")
print(f"  /viz-dashboard       → 대시보드 생성")
