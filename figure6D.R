# For figure 6D

source('model/plosbioplottheme.R')
library(dplyr)

df.BB <- read.csv('R_brain_behave.csv') # read in the damn file :)

df.BB$group <- cut(df.BB$age,c(0,13,16,21,99))

levels(df.BB$group) <- c('child','EA','LA','adult')
