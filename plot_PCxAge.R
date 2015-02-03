library(ggvis)
library(dplyr)
library(R.matlab)
library(ggplot2)

a<-readMat('PC_age.mat')
a<-as.data.frame(a)
names(a) <- c('Age','PC')
PCage <- a %>% mutate(invage=1/Age - mean(1/Age))
l<-lm(data=PCage, PC~invage)
PCage$pred <- predict(l,PCage)

PCage %>% ggvis(~Age,~pred) %>% layer_points()

p<-ggplot(PCage,aes(x=Age,y=PC))+
  geom_line(aes(y=pred)) +
  geom_point(color=I('red'),alpha=I(.4)) +
  theme_bw() + 
  #geom_smooth() +
  ggtitle('PC by Age')

print(p)
ggsave(file="PCAgeModel.png",p, height=2.5,width=2.5)
