library(effects) # install.packages(c('effects','ggplot2','MASS'))
library(ggplot2)
library(MASS)
#setwd(file.path(getMainDir(), "Miscellaneous", "Marek_PC_Mediation_Moderation"))

#C-O
age_pc_acc <- read.csv("csv/agePCperf.csv", header=FALSE, col.names=c("age", "pc", "acc"))
age_pc_rt <- read.csv("csv/RT_age_PC.csv", header=FALSE, col.names=c("age", "pc", "rt"))

co_pc_perf <- cbind(age_pc_acc, rt=age_pc_rt[,"rt"])

co_pc_perf$age.c <- co_pc_perf$age - mean(co_pc_perf$age)
co_pc_perf$pc.c <- co_pc_perf$pc - mean(co_pc_perf$pc)


# ACC
acc.ms <- summary(acc.m <- rlm(acc ~ age.c*pc.c, co_pc_perf))
png("imgs/ageplot_moderation_acc.png", width=8, height=8, units="in", res=200)
plot(effect(term="age.c:pc.c",mod=acc.m,default.levels=5),multiline=TRUE)
dev.off()

# RT
rt.ms  <- summary(rt.m  <- rlm(rt  ~ age.c*pc.c, co_pc_perf))
png("imgs/ageplot_moderation_rt.png", width=9, height=8, units="in", res=200)
plot(effect(term="age.c:pc.c",mod=rt.m,default.levels=5),multiline=TRUE)
dev.off()

print(mean(co_pc_perf$age))

# age against accuracy | RT
ggplot(co_pc_perf, aes(x=age, y=acc)) + geom_point(size=3.6) + stat_smooth(se=FALSE) + ggtitle('age vs Acc')
ggplot(co_pc_perf, aes(x=age, y=rt)) + geom_point(size=3.6) + stat_smooth(se=FALSE) + ggtitle('age vs RT')

# cut PC into 5 groups
co_pc_perf$pc_chunk <- Hmisc::cut2(co_pc_perf$pc, g=5)

ggplot(co_pc_perf, aes(x=age, y=rt)) + geom_point(size=3.6) + stat_smooth(se=FALSE) + facet_wrap(~pc_chunk)+ ggtitle('PC grouped age vs Acc')
ggplot(co_pc_perf, aes(x=age, y=acc)) + geom_point(size=3.6) + stat_smooth(se=FALSE) + facet_wrap(~pc_chunk) + ggtitle('PC grouped age vs RT')
