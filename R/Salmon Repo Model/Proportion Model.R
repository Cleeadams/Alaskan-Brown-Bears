# Reproduction Function for Salmon

rm(list = ls())

#Libraries

library(latex2exp)



# Collect some data about sockeye salmon mortality at different temperatures

temps <- c(seq(11,14,.2),2,22.2)
survival <- c(rep(1,16),.5,.5)


# Plot the points
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
grid(NULL,NULL,col='lightgrey',lty=6,lwd=2)




temp <- seq(-7,37,.1)

t_opt <- 12.5


# Function 1: squared with c = .01
c <- 1/(2.5-t_opt)^2
c

f1 <- 1 / (1 + c*(temp - t_opt)^2)

points(temp,f1,
     pch=19,
     cex=.7, 
     ylab='f(x)', 
     xlab='Temperature (celsius)',
     main='Proportion of Salmon Migration',
     cex.lab=1.5,
     cex.main=2)
grid(NULL,NULL,col='lightgrey',lty=6)


# Function 2: 4th power with c = .0001
c <- 1/(2.5-t_opt)^4
c

f2 <- 1 / (1 + c*(temp - t_opt)^4)

points(temp,f2,
       pch=19,
       cex=.7, 
       ylab='f(x)', 
       xlab='Temperature (celsius)',
       main='Proportion of Salmon Migration',
       cex.lab=1.5,
       cex.main=2)


# Function 3: 4th power with c = .01
c <- 1/100
c

f3 <- 1 / (1 + c*(temp - t_opt)^4)

points(temp,f3,
       pch=19,
       cex=.7, 
       ylab='f(x)', 
       xlab='Temperature (celsius)',
       main='Proportion of Salmon Migration',
       cex.lab=1.5,
       cex.main=2)


lines(temp,f1,lwd=5,col=4)
lines(temp,f2,lwd=5,col='darkorange')
lines(temp,f3,lwd=5,col=3)
legend(22,1,legend=TeX(c('$R_1(T), c=.01$','$R_2(T), c=.0001$', '$R_2(T), c=.01$')),
       col=c(4,'darkorange'),
       lty=1,
       cex=1.2
       )



t <- 20.4

1 / (1 + c*(t - t_opt)^4)




