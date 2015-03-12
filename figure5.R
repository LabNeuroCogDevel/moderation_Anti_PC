# Figure 5 crap
source('plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)


PCage <- df.BB %>% mutate(invage=1/age - mean(1/age))
l<-lm(data=PCage, pc~invage) #linear model of PC vs. Age
PCage$pred <- predict(l,PCage)

#PCage %>% ggvis(~Age,~pred) %>% layer_points()
# This is william playing

p<-ggplot(PCage,aes(x=age,y=pc))+
  geom_line(aes(y=pred),color='red',size=1.5) +
  geom_point(color='black') +
  
  plosbioplottheme() +

  #geom_smooth() +
  #ggtitle('PC by Age') +
  xlab('Age') +
  ylab('Cingulo-opercular Participation Coefficient')

print(p)
ggsave(file="PCAgeModel.eps",p,path='/Volumes/rcn1//bea_res/Luna/ARTICLES/ACTIVE/Scott Marek/Network Participation Dev Paper/Plos_Figures/Draft')
