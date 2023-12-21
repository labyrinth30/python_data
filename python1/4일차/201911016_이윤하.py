import pandas as pd
import random

# Generate random data for 10 social media users
users = []
for i in range(1, 11):
    user = {
        '사용자ID': f'사용자{i}',
        '팔로워수': random.randint(100, 1000),
        '게시물수': random.randint(5, 50),
        '좋아요수': random.randint(50, 500)
    }
    users.append(user)

# Create a DataFrame from the generated data
df = pd.DataFrame(users)

# Save the data to an Excel file
excel_filename = 'social_media_data.xlsx'
df.to_excel(excel_filename, index=False)

print(f'데이터가 {excel_filename} 파일에 저장되었습니다.')
