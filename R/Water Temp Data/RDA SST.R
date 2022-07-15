# Analyzing RDA Data
# ranges from 1873 - 2014
# Southern peninsula of Alaska

library(zoo)

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")

# Load data
tab <- read.csv("RDA SST.csv")

# Let's build our data frame
df <- data.frame(tab$YR,tab$MO,tab$DY,tab$SST)
colnames(df) <- c('year','month','day','SST')

# Find Montly Average
monavg <- aggregate(SST~month+year,df,mean)

# Create a Date column
monavg$date <- with(monavg, sprintf('%s-%02s',year,month))
monavg$date <- as.yearmon(monavg$date)

newsst <- subset(monavg$SST,monavg$month>=6 & monavg$month<=7)
newdate <- subset(monavg$date,monavg$month>=6 & monavg$month<=7)

slr <- lm(newsst~newdate)
plot(newdate,newsst)
abline(slr)

plr <- lm(newsst~poly(newdate,2,raw=TRUE))
Dates <- seq(1870,2020,1)
yhates <- predict(plr,newdata=data.frame(newdate=Dates))
lines(Dates,yhates)
head(newsst)
summary(slr)

# fitting exponential model
sapply(monavg, class)
exp.date <- as.numeric(newdate)
elr <- lm(log(newsst)~exp.date)
timevalues <- seq(1900,2022,.1)
exp.sst <- exp(predict(elr,list(exp.date=timevalues)))
lines(timevalues,exp.sst,lwd=2,col='red')
