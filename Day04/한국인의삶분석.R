library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "D:/JYN/Day04/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare

welfare <- rename(welfare, 
                  gender = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job=h10_eco9,
                  code_region=h10_reg7
)

head(welfare$gender)
count(welfare, gender)

welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)

table(is.na(welfare$gender)) 

welfare$gender <- ifelse(welfare$gender == 1, "남", "여" )
table(welfare$gender)

qplot(welfare$gender)



class(welfare$income)

summary(welfare$income)
qplot(welfare$income) + xlim(0,1000)

table(is.na(welfare$income)) 
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA , welfare$income)

table(is.na(welfare$income))


# 성별 월급의 비교
## 1. NA 는 빼고 분석
## 2. 성별로 그룹! (group_by)
## 3. 성별로 그룹 지어 놓은거 평균 내기

sex_income <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(mean_income = mean(income))


View(sex_income)  
ggplot(sex_income, aes(x = gender, y = mean_income))+geom_col()

qplot(welfare$birth)

welfare$age <- 2015 - welfare$birth + 1
qplot(welfare$age)
summary(welfare$age)

age_income <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(age)%>% 
  summarise(mean_income = mean(income))

View(age_income)

age_income %>% ggplot(aes(x = age, y = mean_income)) + geom_line()

# 연령대별
# 평균 월급

welfare <- welfare %>% 
  mutate(age2 = ifelse(age < 30,"young", 
                       ifelse(age <= 59, "middle", "old")))

table(welfare$age2) # 빈도수 정리 테이블

age_income2 <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(age2)%>% 
  summarise(mean_income = mean(income))

age_income2

age_income2 %>% ggplot(aes(x=age2,y=mean_income)) + 
  geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))

# 연령대 성별 평균 수입

age_income_gen <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(age2, gender) %>%
  summarise(mean_income = mean(income))

age_income_gen %>% ggplot(aes(x=age2,y=mean_income, fill = gender)) + 
  geom_col(position = "dodge") + 
  scale_x_discrete(limits = c("young","middle","old"))

age_income_gen %>% ggplot(aes(x=age2,y=mean_income)) + 
  geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))+
  facet_grid(aes(gender))


# 나이 + 성별 평균 월급의 흐름을 알고 싶다
# 분석 후 시각화 (시계열로)
# 시계열인 경우, fill 대신 "col = " 사용


age_gen_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age,gender) %>% 
  summarise(mean_income = mean(income))

age_gen_income  

age_gen_income %>% ggplot(aes(x = age, y = mean_income, col = gender)) + geom_line()

############################

list_job <- read_excel("D:/JYN/Day04/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
View(list_job)

head(welfare$code_job)
welfare <- left_join(welfare, list_job, id = "code_job")

job_income <- welfare %>% 
  filter(!is.na(income)& !is.na(job)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) 


job_income %>% ggplot(aes(x = job, y = mean_income)) + geom_point()
