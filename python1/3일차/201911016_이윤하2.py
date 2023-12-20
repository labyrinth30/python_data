# print(100 > 200 or 400  > 100)
# print(100 > 200 and 400  > 100)
# print(not 100 < 200)
#
# isA = True
#
# print(int(isA))

# 값 입력
# flag = input('마음에 드는 옷을 찾았나요? (예/아니요): ')
#
# # 분기점
# if flag == '예':
#     print('축하합니다')
# elif flag == '아니요':
#     print('아쉽네요')
# else:
#     print('예, 아니요로만 입력하세요')

# gpt로 물어본 무한 반복
# 값 입력
flag = input('좋아하는 옷을 찾았나요? (예/아니오): ')

# 조건문
while flag not in ['예', '아니오', '별로요']:
    print('예나 아니오로만 입력해주세요.')
    flag = input('좋아하는 옷을 찾았나요? (예/아니오): ')

if flag == '예':
    print('축하합니다.')
elif flag == '아니오':
    print('안타깝네요.')
elif flag == '별로요':
    print('아쉽네요')
