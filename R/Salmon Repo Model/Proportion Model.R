# Reproduction Function for Salmon

rm(list = ls())



# Collect some data about sockeye salmon mortality at different temperatures

temps <- c(seq(11,14,.2),2,22.2)
survival <- c(rep(1,16),.5,.5)


plot(temps,survival,
     pch='x',
     cex=1.25, 
     ylab='Proportion', 
     xlab='Temperature (celsius)',
     main='Proportion of Salmon Survival',
     cex.lab=1.5,
     cex.main=2,
     xlim=c(-2,30),
     ylim=c(0,1))
grid(NULL,NULL,col='lightgrey',lty=6)




temp <- seq(-7,37,.1)

t_opt <- 12.5
c <- 1/(2.5-t_opt)^4
c

f <- 1 / (1 + c*(temp - t_opt)^4)

points(temp,f,
     pch=19,
     cex=.7, 
     ylab='f(x)', 
     xlab='Temperature (celsius)',
     main='Proportion of Salmon Migration',
     cex.lab=1.5,
     cex.main=2)
grid(NULL,NULL,col='lightgrey',lty=6)
lines(temp,f,lwd=5,col='darkorange')


t <- 20.4

1 / (1 + c*(t - t_opt)^4)




