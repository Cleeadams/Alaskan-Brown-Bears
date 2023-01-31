# USGS Bradley river

# Libraries
library(zoo)

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")


tab <- read.delim("USGS Bradley River edit.txt")
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

# Plot data
slr <- lm(newsst~newdate)
plot(newdate,newsst)
abline(slr)

length(newsst)

