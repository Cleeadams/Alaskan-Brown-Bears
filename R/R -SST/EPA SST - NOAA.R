# EPA CSV Sea Surface Temperarture

# Directory
setwd("C:/Users/Connor/OneDrive/Desktop/GitHub/Alaskan-Brown-Bears/R/Water Temp Data/")

# Libraries
library(latex2exp)

tab <- read.csv("SST.csv")

head(tab)
attach(tab)
# Change temp to celsius
annomaly.celsius <- (Annual.anomaly - 32) * (5/9)

# Plot data
plot(Year, annomaly.celsius, 
     ylab=TeX(r'(Temperature Anomaly ( $\degree$C))'), 
     xlab='Time (Yrs)', 
     main='Average Global SST From 1880-2020')
grid(NULL, NULL, lty=5, col='lightgrey', lwd = 2)
points(Year, annomaly.celsius, col='4', pch=19, cex=.7)
model <- lm(annomaly.celsius~poly(Year,3,raw=TRUE))
Years <- seq(1875,2025,1)
yhats <- predict(model,newdata=data.frame(Year=Years))
lines(Years,yhats,lwd=2,col='red')


# Lets make it exponential

# elr <- lm(log(Annual.anomaly)~Year)
# timevalues <- seq(1880,2022,.1)
# exp.sst <- exp(predict(elr,list(Years=timevalues)))
# 
# lines(timevalues,exp.sst)
# length(exp.sst)
