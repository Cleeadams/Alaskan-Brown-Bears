# Average salmon escapement in Bristol Bay since 2017

library(openxlsx)
library(dplyr)
library(tidyr)
library(qpcR)

setwd('C:/Users/Connor/OneDrive/Documents/Thesis/Salmon Escapement/Data')

tab1 <- read.xlsx('2017.xlsx')
tab2 <- read.xlsx('2018.xlsx')
tab3 <- read.xlsx('2019.xlsx')
tab4 <- read.xlsx('2020.xlsx')
tab5 <- read.xlsx('2021.xlsx')


tab <- list(tab1,tab2,tab3,tab4,tab5)
sumdf <- c()
p <- 1
for (i in tab) {
  df <- data.frame(matrix(nrow=dim(i)[1], ncol=dim(i)[2]))
  df[] <- data.frame(lapply(i, as.integer))
  df[is.na(df)] <- 0
  
  sumdf[p] <- sum(df[,c(seq(2,18,2))])
  p = p+1
}


mean(sumdf)
boxplot(sumdf)
median(sumdf)
