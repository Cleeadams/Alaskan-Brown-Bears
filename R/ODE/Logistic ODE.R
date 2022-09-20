# graphing a logistic ODE

xval <- seq(0,6,.1)
K <- 5
r <- 1

yval <- r*xval*(1-(xval/K))

plot(xval,yval,
     pch=19,
     cex=.7, 
     ylab='dN/dt', 
     xlab='N',
     xaxt="n",
     yaxt="n",
     main='Logistic Growth ODE',
     cex.lab=1.5,
     cex.main=2)
grid(NULL,NULL,col='lightgrey',lty=6)
lines(xval,yval,lwd=5,col='darkorange')
