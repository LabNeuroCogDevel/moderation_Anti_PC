
##
# Q: does participation coefficient mediate age on performance?
# A: no. :(
#
#        PC
#     */    \  (Not Sig.)
#     /      \
#  Age --*-- % correct
#
#
#  p=.29 for medation 
##


# install needed packages
#install.packages(c('MBESS','gsl','lavaan') )
library(MBESS)  # mediation
library(lavaan) # sem

# load age, participation coeff and performance (percent correct)
allx<-read.table('agePCperf.csv', sep=",",header=F)
names(allx) <- c('age','part.coeff','per.cor')

# we only really care about development
maxage<-15
x <- allx[ allx$age < maxage, ]

# try mediation from MBESS package
v<-mediation(x$age, x$part.coeff, x$per.cor)



# use SEM from lavaan
m <- '
per.cor ~ age
per.cor ~ part.coeff
part.coeff ~ age
'
summary(sem(m, x))





####
# look at RT instead of %corr
# p is .33 if allx, .44 if unly under 15 yo
allx<-read.table('RT_age_PC.csv', sep=",",header=F)
names(allx) <- c('age','part.coeff','RT')
x <- allx[ allx$age < maxage, ]
v <- mediation(x$age, x$part.coeff, x$RT)
p <- v$Y.on.X.and.M$Regression.Table[3,4] 
print(p) # still not significant


