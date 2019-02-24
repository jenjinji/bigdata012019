library(ggplot2)
library(dplyr)

midwest <- as.data.frame(ggplot2::midwest)
ggplot(midwest, aes(x = poptotal,y = popasian)) + geom_point() + xlim(0,1000000) + ylim(0,100000)


mpg <- as.data.frame(ggplot2::mpg)
ggplot(data=mpg, aes(x=displ, y = hwy)) + geom_point() 

df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

ggplot(df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(mpg, aes(x = drv, y = hwy)) + geom_boxplot()
