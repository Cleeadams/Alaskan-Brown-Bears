# Reproduction Function for Salmon

rm(list = ls())

temp <- seq(-7,37,.1)

crit <- 20.43
mu <- 14.3
sigma <- (crit-mu)/.52
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




x <- 7.8
z <- (x-mu)/sigma
z
