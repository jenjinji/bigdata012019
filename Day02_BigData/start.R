a <- 100
b <- 200

print(a+b)
# 주석 (설명)
# 프로그램 전체 제어
  # 1. 프로그램은 순차적으로 실행
  # 2. 조건
  # 3. 반복
# 데이터의 자료 구조
  # 데이터 프레임 = 벡터(열) + 리스트 (행)

name <- c("김지훈", "이유진", "박동현", "김민지")
name
name[4] <-"송민지"
name

str(name) # structure
table(name) # summarize to a table form
class(name) # shows the type of the data
typeof(name) # shows specific type of the data

engScore <- c(90,80,60,70)
mathScore <- c(50,60,100,20)

midterm <- data.frame(name,engScore,mathScore)
midterm

str(midterm) # structure
table(midterm) # summarize to a table form
class(midterm) # shows the type of the data
typeof(midterm) # shows specific type of the data

View(midterm)

lastTerm <- data.frame(name2 = c("song", "kim", "park"), 
                        eng2 = c(100,50,80),
                        math2 = c(50,60,80))
View(lastTerm)

lastTerm$name2 # 열 접근에는 $을 사용해서 접근

str(lastTerm$name2) # structure
table(lastTerm$name2) # summarize to a table form
class(lastTerm$name2) # shows the type of the data
typeof(lastTerm$name2) # shows specific type of the data
table(lastTerm$eng2)

test <- c("apple", "banana", "kiwi", "apple", "banana", "apple")
table(test)


mean(lastTerm$eng2)
mean(lastTerm$math2)

midTerm2 <- read.csv("D:/JYNBD/Day02_BigData/midText2.csv")
View(midTerm2)
str(midTerm2)

library(readxl)
midterm3 <- read_excel("D:/JYNBD/Day02_BigData/midtest3.xlsx")
View(midterm3)

list <- ls()
class(list)
rm(ls())
rm(list=ls())
ls()

midterm3 <- read_excel("D:/JYNBD/Day02_BigData/midtest3.xlsx")
midterm3$name

subMidTerm <- data.frame(name = midterm3$name,
                         tel = midterm3$tel)
subMidTerm$age <- c(20,30,40)
subMidTerm

addr <- c("Seoul","Busan","Gyeonggi")
subMidTerm$addr <- addr
subMidTerm

names(subMidTerm)
subMidTerm[1] # extract column

subMidTerm[1,] # extract row
subMidTerm[1,1] # extract datum
subMidTerm[3,1]
subMidTerm[3,3]


# 행과 열 삭제
subMidTerm2<- subMidTerm[,-1]
subMidTerm2
subMidTerm3 <- subMidTerm[-1, ]
subMidTerm3
subMidTerm4 <- subMidTerm[,-c(2:4)]
subMidTerm4
subMidTerm5 <- subMidTerm[,-c(1,3)]
subMidTerm5

temp1 <- c(1:100)
temp2 <- seq(1,10, by=2) # or c(1,3,5,7,9)

