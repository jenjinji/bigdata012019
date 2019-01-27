# 외부 라이브러리 설치

install.packages("glue")
install.packages("ggplot2")
 
# 외부 라이브러리 사용
library(glue)

#  여기에 glue 를 이용하여 프린트 연습

# temp 변수이면, 아무것도 안붙어 있다. 정적인 값 저장
# temp() 함수이면 동적인 처리

# creating a vector
# 할당 연산자 alt +  -
# 파이프 연산자는 alt+/ --> %>%

ages <- c(10,30,50)

ages[1]
ages[1] <- 20
ages[1]

# names vector
# second person changed its name to james
# print all values in the names vector
names <- c("Lim", "Angie", "Becky", "Jenny", "Michelle")
names
names[2] <- "James"
names

# factor 구분 하기
address <- c("서울", "대구", "부산", "군산", "서울", "서울", "대구")
address
address2 <- as.factor(address)
address2

str(address2)
address2[1] <- "광주"
address2
# Can't edit factor. Only allowed when the factor value already exist in the factors

address2[1] <- "대구"
address2

# If you want to add new factor in the list of factors, change the list into characters
# and add new factor. Then change it back to factor

# 입력의 다양한 형태
x <- scan()
x2 <- scan()
x2[2] <- 222
str(x2) # structure
class(x2) # 부류
typeof(x2) # 데이터 유형
is.vector(x2) # 벡터인지 확인


food <-  scan(what = "")
food

str(food)
typeof(food)
class(food)

favorite <- food[1]
# print("내가 제일 좋아하는 음식은 " + favorite)
cat("내가 제일 좋아하는 음식은", favorite)

second <- food[2]
glue("나의 {second} 음식은 2번째로 좋아하는 음식이에요.")










