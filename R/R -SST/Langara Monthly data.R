# Langara Monthly Average pre calculated

# Libraries
library(zoo)

# Directory
setwd("C:/Users/conno/OneDrive - Cal Poly Pomona/Thesis Project/Data")


tab <- read.csv("DATA CANADA/Langara_Island/Langara_Island_Avg_Monthly_SST_English.csv")

# select the months we want to analyze
df <- data.frame(tab[,1],tab[,7:8])

# Remove first row and rename columns
colnames(df) <- c('YEAR','JUN','JUL')
df <- df[-c(1), ,drop=FALSE]

# removing extreme outliers
newjun <- subset(df$JUN,df$JUN<999.99)
newjul <- subset(df$JUL,df$JUL<999.99)
junyear <- subset(df$YEAR,df$JUN<999.99)
julyear <- subset(df$YEAR,df$JUL<999.99)

# Changing data to numeric and date variables
sstjun <- as.numeric(newjun)
sstjul <- as.numeric(newjul)
julyear <- as.numeric(julyear)
junyear <- as.numeric(junyear)
slr <- lm(sstjun~junyear)

plot(junyear,newjun)
abline(slr)
points(junyear+.5,newjun)


# Same conclusion as Langara Daily
