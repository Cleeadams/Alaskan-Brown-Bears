# Reproduction Function for Salmon

rm(list = ls())

#Libraries

library(latex2exp)



# Collect some data about sockeye salmon mortality at different temperatures

temps <- c(seq(11,14,.2),2,22.2)
survival <- c(rep(1,16),.5,.5)


# Scatter Plot of Data
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


# Function 1: squared with c = 1
c <- 1
c

f1 <- 1 / (1 + c*(temp - t_opt)^2)

# Graphs the Line of Function 1
lines(temp,f1,lwd=5,col=4)


# Function 2: squared with c = 0.01
c <- 1/(2.5-t_opt)^2
c

f2 <- 1 / (1 + c*(temp - t_opt)^2)

# Graphs the Line of Function 2
lines(temp,f2,lwd=5,col='darkorange',lty=2)


# Function 3: 4th power with c = 0.01
c <- 1/(2.5-t_opt)^4
c <- .01
c

f3 <- 1 / (1 + c*(temp - t_opt)^4)

# Graphs the Line of Function 3
lines(temp,f3,lwd=5,col=3,lty=3)

# Function 4: 4th power with c = 0.0001
c <- 1/10000
c

f4 <- 1 / (1 + c*(temp - t_opt)^4)

# Graphs the Line of Function 4
lines(temp,f4,lwd=5,col=2,lty=6)

legend(22,1,
       legend=TeX(c('$R(T), c=1.00, p=2$',
                    '$R(T), c=0.01, p=2$', 
                    '$R(T), c=0.01, p=4$', 
                    '$R(T), c=10^{-5}, p=4$')
                  ),
       col=c(4,'darkorange',3,2),
       lty=c(1,2,3,6),
       cex=1
       )




