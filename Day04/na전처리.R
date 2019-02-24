file <- read.csv("D:/JYN/Day04/naData.csv")

file

str(file)

mean(file$english)
mean(file$math)

file$math <- ifelse(is.na(file$math), 0, file$math)
file
mean(file$math)
