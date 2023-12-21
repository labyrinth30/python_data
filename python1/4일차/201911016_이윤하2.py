import pandas as pd

# 엑셀 파일에서 데이터 읽기
file_path = 'social_media_data.xlsx'
df = pd.read_excel(file_path)

# Label6 및 Label7 열의 기술 통계량 계산
Follower_stats = df['Follower'].describe()
Post_stats = df['Post'].describe()
Like_stats = df['Like'].describe()

# 결과 출력
print("팔로우의 기술 통계량:")
print(Follower_stats)

print("\n게시글의 기술 통계량:")
print(Post_stats)

print("\n좋아요의 기술 통계량:")
print(Like_stats)