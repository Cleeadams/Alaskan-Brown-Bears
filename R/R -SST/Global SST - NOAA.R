# NOAA SST from 1880 - 2020

# Clear list
rm(list=ls())

# Directory
setwd("C:/Users/Connor/OneDrive/Desktop/GitHub/Alaskan-Brown-Bears/R/Water Temp Data/")

# Libraries
library(latex2exp)
library(showtext)

font_add_google("Playfair Display", "playfair")
showtext_auto()
showtext_opts(dpi = 96)

tab <- read.csv("NOAA SST.csv")

# Organize column names
colnames(tab) <- c('Year','Temp')

# Plot data
attach(tab)

par(mar = c(5, 5, 2, 2))
plot(Year,Temp,ylab=TeX(r'(Sea Surface Temperature ( $\degree$ C))'),
     xlab='Time (Yrs)',
     # main='SST Anomalies From 1880-2021',
     family = 'playfair',
     cex.lab=1.3,
     cex=1.75,
     cex.axis=1.3
     )
grid(NULL,NULL,col='lightgrey',lty=6)
points(Year,Temp,pch=19,cex=1.47,col=4)

# ELR Model
elr <- lm(log(Temp+.4601)~Year)
timevalues <- seq(1875,2025,.1)
exp.temp <- exp(predict(elr,list(Year=timevalues)))
# lines(timevalues,exp.temp-.4601,lwd=3,col='darkorange')

# Poly Model
plr <- lm(Temp~poly(Year,2,raw=TRUE))
poly.temp <- predict(plr,newdata=data.frame(Year=timevalues))
lines(timevalues,poly.temp,lwd=5,col='darkorange')

A = plr$coef['(Intercept)']
B1 = plr$coef['poly(Year, 2, raw = TRUE)1']
B2 = plr$coef['poly(Year, 2, raw = TRUE)2']
A
B1
B2
slr <- lm(Temp[Year>=1960]~Year[Year>=1960])
abline(slr,lwd=2,col='green')
plot(Year[Year>=1960],residuals(slr))
