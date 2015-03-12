# Figure b
source('plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)


PCage <- df.BB %>% mutate(invage=1/age - mean(1/age))
l<-lm(data=PCage, rt~invage) #linear model of PC vs. Age
PCage$pred <- predict(l,PCage)

#PCage %>% ggvis(~Age,~pred) %>% layer_points()
# This is william playing

p<-ggplot(PCage,aes(x=age,y=rt))+
  geom_line(aes(y=pred),color='red',size=1.5) +
  geom_point(color='black') +
  
  plosbioplottheme() +
  
  #geom_smooth() +
  #ggtitle('PC by Age') +
  xlab('Age') +
  ylab('Reaction Time')

print(p)
ggsave(file="Figure6B.eps",p,path='/Volumes/rcn1//bea_res/Luna/ARTICLES/ACTIVE/Scott Marek/Network Participation Dev Paper/Plos_Figures/Draft')


