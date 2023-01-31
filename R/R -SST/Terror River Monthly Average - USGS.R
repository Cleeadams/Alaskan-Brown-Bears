# USGS Terror River 

# Libraries
library(zoo)

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")


tab <- read.delim("USGS Terror River edit.txt")
tab <- tab[-c(1), ,drop=FALSE]

# Build data frame
df <- data.frame(tab$year_nu,tab$month_nu,tab$mean_va)
colnames(df) <- c('year','month','SST')

# Change character variable to numeric
df$year <- as.numeric(df$year)
df$month <- as.numeric(df$month)
df$SST <- as.numeric(df$SST)

# Create a date column
df$date <- with(df,sprintf('%s-%02s',year,month))
df$date <- as.yearmon(df$date)

# Looking at summer months because this is when Salmon reproduce
newsst <- subset(df$SST,df$month>=6 & df$month<=7)
newdate <- subset(df$date,df$month>=6 & df$month<=7)

# Change date to numeric for plotting exponential line
exp.date <- as.numeric(newdate)

# Plot data
slr <- lm(newsst~newdate)
plot(newdate,newsst)
abline(slr)

# Fit exponential model
elr <- lm(log(newsst)~exp.date)
timevalues <- seq(1986,2023,.1)
exp.sst <- exp(predict(elr,list(exp.date=timevalues)))
lines(timevalues,exp.sst,lwd=2,col='red')

length(newsst)

