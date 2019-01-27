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