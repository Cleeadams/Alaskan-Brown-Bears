# EPA air temperature from 1880 - 2020

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

tab <- read.csv("NOAA air.csv")

# Organize column names
colnames(tab) <- c('Year','Temp')

# Plot data
attach(tab)

plot(Year,Temp,ylab=TeX(r'(Surface Temperature ( $\degree$ C))'),
                        xlab='Time (Yrs)',
                        # main='Temperature Anomalies From 1880-2021')
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
lines(timevalues,exp.temp-.4601,lwd=3,col='green')

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

tata <- seq(0,145,.1)
tata2 <- seq(1880,2025,.1)

a1 <- B2; a1
b1 <- B1 + 2 * B2 * 1880; b1
c1 <- B2*1880^2 + B1*1880 + A; c1

f <- a1 * tata^2 + b1 * tata + c1

lines(tata2,f)
