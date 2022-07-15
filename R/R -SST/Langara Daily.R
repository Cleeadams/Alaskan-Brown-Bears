# New SST in Canada

# Libraries
library(zoo)

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")


tab <- read.csv("DATA CANADA/Langara_Island/Langara_Island_Avg_Daily_SST_English.csv")


# Remove nonrecorded days
df <- subset(tab, X.1!=999.9)
head(df)

# Clean up column names and remove first row because of uselessness
colnames(df) <- c('Date','Salinity','SST','Latitude',
                  'Longitude')
    # Remove first row
df <- df[-c(1), , drop=FALSE]
    # Remove NA columns
df <- df[,-c(6,7,8), drop=FALSE]

# Converting SST to numeric
df$SST <- as.numeric(df$SST)

# Converting Date to a Date Variable instead of Character
df$Date <- as.Date(df$Date)

# Creating a Month Column and Year column
df$Month <- format(df$Date,format='%m')
df$Year <- format(df$Date,format='%Y')
# Making those columns numeric
df$Month <- as.numeric(df$Month)
df$Year <- as.numeric(df$Year)

# Focusing on summer months because that's when salmon reproduce
newsst <- subset(df$SST,df$Month>=6 & df$Month<=6)
newmonth <- subset(df$Month,df$Month>=6 & df$Month<=6)
newyear <- subset(df$Year,df$Month>=6 & df$Month<=6)
newdf <- data.frame(newsst,newmonth,newyear)

# Finding summer monthly average
monthlyaverage <- aggregate(newsst~newmonth+newyear,newdf,mean)

# Creating a date column to help plot data
monthlyaverage$Date <- with(monthlyaverage, sprintf("%s-%02s", newyear, newmonth))
monthlyaverage$Date <- as.yearmon(monthlyaverage$Date)

# Plot new SST versus time
plot(monthlyaverage$Date,monthlyaverage$newsst,
     xlab='Time (Monthly)',ylab='SST (C)',
     main='Sea Surface Temperature Over 85 Years')


mon_avg <- aggregate(SST~Month+Year,df,mean)
mon_avg$Date <- with(mon_avg, sprintf("%s-%02s", Year, Month))
mon_avg$Date <- as.yearmon(mon_avg$Date)

# Plot SST versus time
plot(mon_avg$Date,mon_avg$SST,xlab='Time (Monthly)',ylab='SST (C)',
     main='Sea Surface Temperature Over 85 Years')

# attaching my useful data
attach(mon_avg)

# Designing a polynomial regression curve
slr <- lm(SST~poly(Date,2,raw=TRUE))
Dates <- seq(1930,2025,1)
yhats <- predict(slr,newdata=data.frame(Date=Dates))
lines(Dates,yhats)

# Designing an exponential regression curve
exp.date <- as.numeric(Date)
elr <- lm(log(SST)~ exp.date)
timevalues <- seq(1930,2025,.01)
exp.sst <- exp(predict(elr,list(exp.date=timevalues)))
lines(timevalues,exp.sst,lwd=2,col='red')
