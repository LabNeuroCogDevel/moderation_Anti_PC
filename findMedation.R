
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
#   per.cor ~ part.coeff:  P>|z| == .569
##


# install needed packages
#install.packages(c('MBESS','gsl','lavaan') )

# load data
x<-read.table('agePCperf.csv', sep=",",header=F)
names(x) <- c('age','part.coeff','per.cor')

# try mediation from MBESS package
library(MBESS)
mediation(x$age, x$part.coeff, x$per.cor)



# use SEM from lavaan
library(lavaan)
m <- '
per.cor ~ age
per.cor ~ part.coeff
part.coeff ~ age
'
summary(sem(m, x))

