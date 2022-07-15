# EPA air temperature from 1901 - 2020

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")

# Libraries
library(latex2exp)

tab <- read.csv("epa-temp.csv")

colnames(tab) <- c('Year','Temp.','Low Trop Temp (UAH)','Low Trop Temp (RSS)')

# convert temp to celsius
annomaly.celsius <- (5/9)*(tab$Temp. - 32)

attach(tab)

# Plot data
plot(Year, annomaly.celsius, 
     ylab=TeX(r'(Temperature Anomaly ( $\degree$C))'), 
     xlab='Time (Yrs)', 
     main='Average Global Temp. From 1901-2020')
grid(NULL, NULL, lty=5, col='lightgrey', lwd = 2)
points(Year, annomaly.celsius, col='4', pch=19, cex=.7)
model <- lm(annomaly.celsius~poly(Year,3,raw=TRUE))
Years <- seq(1890,2025,1)
yhats <- predict(model,newdata=data.frame(Year=Years))
lines(Years,yhats,lwd=2,col='red')
attach(tab)






