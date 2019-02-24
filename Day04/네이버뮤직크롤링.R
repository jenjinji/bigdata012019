#  네트워크로 연결
library(rvest) 
library(dplyr) # %>% 사용하려고 부름

#  문서를 읽어야 한다 --> 모든 문서는 RAM이라는 공간에 들어와 있어야 한다
url = "http://music.naver.com/listen/top100.nhn?domain=DOMESTIC&duration=1h"
# 전체 100순위까지 원하면 
# 반복문을 통해서 한꺼번에 불러오면 된ㄷ

# 코딩이 너무 길어지니까 따로 변수를 지정해서 그 변수를 함수안에 넣어준다
download.file(url,destfile = "navermusic.html",quiet = T) 
naver_music <- read_html("navermusic.html")


# 보통 태그보다는 클래스로 분리해서 가지고 온다 (같은 이름의 태그가 너무 많기 때문에)

#  데이터 추출(열:벡터), 전처리
## 1. 순위

ranking <- naver_music %>% 
  html_nodes("._tracklist_move .ranking") %>% 
  html_text() %>% 
  as.numeric() # 숫자로 바꿔야지 숫자 비교가 가능하다

ranking

## 2. 순위변동
change <- naver_music %>% 
  html_nodes("._tracklist_move .change") %>% 
  html_text() %>% 
  gsub(pattern = "\r\n||\t||\n||\r", replacement = "") # 전처리 필요

change

## 3. 노래제목

title <- naver_music %>% 
  html_nodes("._tracklist_move .title") %>% 
  html_text()%>% 
  gsub(pattern = "\r\n||\t||\n||\r", replacement = "")

# title <- naver_music %>% 
#   html_nodes(".name") %>%
#         html_text()%>%
#         gsub(pattern = "\r\n||\t||\n||\r", replacement = "")%>% 
#   trimws() # 많은 공백들을 없앤다

title

## 4. 가수

artist <- naver_music %>% 
  html_nodes("._tracklist_move .artist a") %>% 
  html_text()%>% 
  gsub(pattern = "\r\n||\t||\n||\r", replacement = "")

artist

#  데이터 프레인에 넣는다

musicTop50 <- data.frame(ranking,change,title,artist)
musicTop50 %>% head()
