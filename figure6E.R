# Figure 6E
source('plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)
  
df.test <- df.PCbygroup %>% filter(group=='Child') 

l<-lm(data=df.test, rt~pc) #linear model of PC vs. Age

df.test$pred <- predict(l,df.test)

#PCage %>% ggvis(~Age,~pred) %>% layer_points()
# This is william playing

p<-ggplot(df.test,aes(x=pc,y=rt))+
  geom_line(aes(y=pred),color='red',size=1.5) +
  geom_point(color='black') +
  
  plosbioplottheme() +
  
  #geom_smooth() +
  #ggtitle('PC by Age') +
  xlab('Cingulo-opercular Participation Coefficient') +
  ylab('Reaction Time')

print(p)
ggsave(file="Figure6e.eps",p,path='/Volumes/rcn1//bea_res/Luna/ARTICLES/ACTIVE/Scott Marek/Network Participation Dev Paper/Plos_Figures/Draft')


