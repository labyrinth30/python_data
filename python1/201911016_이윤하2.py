import pandas as pd
import random

# 10명의 대학생과 3과목의 무작위 시험 점수 생성
students_data = {'학생': [f'학생{i+1}' for i in range(10)]}
과목 = ['과목_A', '과목_B', '과목_C']

for 과목 in 과목:
    students_data[과목] = [random.randint(0, 100) for _ in range(10)]

# 데이터프레임 생성
df = pd.DataFrame(students_data)

# 생성된 데이터 출력
print("생성된 데이터:")
print(df)

# 각 과목별 기술 통계 출력
print("\n기술 통계:")
print(df.describe())
