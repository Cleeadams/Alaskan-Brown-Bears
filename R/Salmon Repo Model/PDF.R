# Reproduction Function for Salmon

rm(list = ls())

temp <- seq(-5,30,.1)

crit <- 24.4
mu <- 14.3
sigma <- (crit-mu)/3
sigma

f <- 1 / (sigma * sqrt(2*pi)) *
  exp(-.5 * ( (temp - mu) / sigma )^2)

plot(temp,f,
     pch=19,
     cex=.7, 
     ylab='f(x)', 
     xlab='Temperature (celsius)',
     main='Normal PDF of Salmon Migration',
     cex.lab=1.5,
     cex.main=2)
grid(NULL,NULL,col='lightgrey',lty=6)
lines(temp,f,lwd=5,col='darkorange')

