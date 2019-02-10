a <- 100
b <- 200
c <- 100

print(a == b) # 비교의 결과는 참 아니면 거짓
print(a == c)

if(a!=b){ # 제어문 안에 조건이 참일 때만 실행된다.
  print("두 수가 달라요")
} else{
  print("두 수가 같아요")
} # if-close

######################################################
# 순차적 실행 기본
# 조건문(조건에 따라서 다르게 처리해야하는 경우)
# 반복문(여러번 반복해서 처리해야 할 때)

i <- 2
# <, > 비교 연산자
if(i < 5){
  print("smaller than 5")
} else{
  print("greater than 5")
}

i2 <- "빅데이터"
# <, > 비교 연산자
if(i2 == "빅데이터"){
  print("빅데이터 반이 맞습니다")
} else if(i2 == "파이썬"){
  print("파이썬 반이군요")
} else{
  print("아무 반도 아니군요")
}

var <- "apple"

if(var == "apple"){
  print("사과이면 제철이군요")
} else if(var == "pear"){
  print("배이면 설에 먹어요")
}else if(var == "kiwi"){
  print("키위면 수입이에요")
}else {
  print("아무것도 아니면 과일이 아닌가봐요.")
} 

install.packages("lubridate")
library(lubridate)

date <- now()
date

year(date)
month(date)
day(date)
wday(date, label = T) # 요일 알려주는 함수

hour(date)
minute(date)
second(date)

# 11시 전이면 굿모닝
# 15시 전이면 굿 애프터눈
# 20시 전이면 굿 이브닝
# 기타이면 굿나잇

if(hour(date) < 11){
  print("Good Morning")
} else if(hour(date) < 15){
  print("Good Afternoon")
} else if(hour(date) < 20){
  print("Good Evening")
} else{
  print("Good Night")
}

date + minutes(10) # date에 10분을 더한 날짜와 시
date

#################################################

# 입력받은 값 판별
input <- scan(what = "") # 스캔은 기본값이 숫자. 문자 입력을 원하면 추가적으로 what =""

if(input == "100점"){
  print("Perfect score")
} else{
  print("Try next time")
}

i = 99
result = ifelse(i>90,"A", "not A")
result

temp3 <- 80
result <- ifelse(temp3 >= 80, "pass", "fail")
result

#################################################

temp4 <- 10
while(temp4 >7){
  print("greater than 7!")
} # infinite loop. if the condition is true, it runs infinitely

temp4 <- 10
while(temp4 >7){
  print("greater than 7!")
  temp4 <- temp4 - 1
  temp4
} 
print(temp4)


#################################################

temp5 <- c(1:5)
for(temp6 in temp5){
  print(temp6)
} 

name <- c("Kim","Park", "Song", "Jeong")
for(temp8 in name){
  cat("Your name is ", temp8, ".\n")
}
age <- c(30,50,15,45)
student <- data.frame(name = name,
                      age = age)
student

for(temp9 in student$name){
  print(temp9)
}


while(TRUE){
  input2 <- scan()
  print(input2)
  if(input2 == 0){
    print("Ending the program")
    break
  }
}
