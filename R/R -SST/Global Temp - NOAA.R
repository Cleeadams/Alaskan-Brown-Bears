# EPA air temperature from 1880 - 2020

# Clear list
rm(list=ls())

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")

# Libraries
library(latex2exp)

tab <- read.csv("NOAA air.csv")

# Organize column names
colnames(tab) <- c('Year','Temp')

# Plot data
attach(tab)

plot(Year,Temp,ylab=TeX(r'(Surface Temperature ( $\degree$ C))'),
                        xlab='Time (Yrs)',
                        main='Temperature Anomalies From 1880-2021')
grid(NULL,NULL,col='lightgrey',lty=6)
points(Year,Temp,pch=19,cex=.7,col=4)

# ELR Model
elr <- lm(log(Temp+.4601)~Year)
timevalues <- seq(1875,2025,.1)
exp.temp <- exp(predict(elr,list(Year=timevalues)))
lines(timevalues,exp.temp-.4601,lwd=3,col='green')

# Poly Model
plr <- lm(Temp~poly(Year,2,raw=TRUE))
poly.temp <- predict(plr,newdata=data.frame(Year=timevalues))
lines(timevalues,poly.temp,lwd=3,col='darkorange')

A = plr$coef['(Intercept)']
B1 = plr$coef['poly(Year, 2, raw = TRUE)1']
B2 = plr$coef['poly(Year, 2, raw = TRUE)2']
A
B1
B2


