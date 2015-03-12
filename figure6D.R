# For figure 6D

source('plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)

df.BB$group <- cut(df.BB$age,c(0,13,16,21,99))

levels(df.BB$group) <- c('Child','EA','LA','Adult')

df.PCbygroup <- df.BB %>% group_by(group) %>%
mutate(PClevel=ifelse(pc<=median(pc),'low','high'))

df.HLPC <- df.PCbygroup %>% group_by(group,PClevel) %>%
summarize(rtmean=mean(rt),rtse=sd(rt)/sqrt(n())) %>%
mutate(semax=(rtse/2)+rtmean,semin=rtmean-(rtse/2))


pp<-ggplot(df.HLPC,aes(x=group,y=rtmean)) +
  geom_line(aes(color=PClevel, group=PClevel)) +
  scale_color_manual(values=c('red','blue')) +
  geom_errorbar(aes(ymin=semin,ymax=semax,color=PClevel),width=.3) +
  plosbioplottheme() +
  xlab('Group') +
  ylab('Antisaccade Reaction Time')

ggsave(file="Fig6D.eps",pp,path='/Volumes/rcn1//bea_res/Luna/ARTICLES/ACTIVE/Scott Marek/Network Participation Dev Paper/Plos_Figures/Draft')
