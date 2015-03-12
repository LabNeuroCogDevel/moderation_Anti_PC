# Figure 6C
source('plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)


l<-lm(data=df.BB, rt~pc) #linear model of PC vs. Age
df.BB$pred <- predict(l,df.BB)

#PCage %>% ggvis(~Age,~pred) %>% layer_points()
# This is william playing

p<-ggplot(df.BB,aes(x=pc,y=rt))+
  geom_line(aes(y=pred),color='red',size=1.5) +
  geom_point(color='black') +
  
  plosbioplottheme() +
  
  #geom_smooth() +
  #ggtitle('PC by Age') +
  xlab('Cingulo-opercular Participation Coefficient') +
  ylab('Reaction Time')

print(p)
ggsave(file="Figure6c.eps",p,path='/Volumes/rcn1//bea_res/Luna/ARTICLES/ACTIVE/Scott Marek/Network Participation Dev Paper/Plos_Figures/Draft')

