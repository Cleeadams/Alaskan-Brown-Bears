# USGS Rivers

# clear variable
rm(list=ls())

# Libraries
library(zoo)
library(latex2exp)
library(showtext)

font_add_google("Playfair Display", "playfair")
showtext_auto()
showtext_opts(dpi = 96)

# Directory
setwd("C:/Users/Connor/OneDrive/Desktop/GitHub/Alaskan-Brown-Bears/R/")

# Load data frames
tab1 <- read.delim("USGS River Temp/Battle")
tab2 <- read.delim("USGS River Temp/Bradley")
tab3 <- read.delim("USGS River Temp/Cooper")
tab4 <- read.delim("USGS River Temp/Iliamna")
tab5 <- read.delim("USGS River Temp/Kenai R - Cooper")
tab6 <- read.delim("USGS River Temp/Kenai R - Soldotna")
tab7 <- read.delim("USGS River Temp/Koktuli")
tab8 <- read.delim("USGS River Temp/Kokwok")
tab9 <- read.delim("USGS River Temp/Kroto Creek")
tab10 <- read.delim("USGS River Temp/Matanuska")
tab11 <- read.delim("USGS River Temp/Moose")
tab12 <- read.delim("USGS River Temp/Nuyakuk")
tab13 <- read.delim("USGS River Temp/Palmer")
tab14 <- read.delim("USGS River Temp/Red Cloud")
tab15 <- read.delim("USGS River Temp/Russell")
tab16 <- read.delim("USGS River Temp/Ship")
tab17 <- read.delim("USGS River Temp/Susitna")
tab18 <- read.delim("USGS River Temp/talkeetna")
tab19 <- read.delim("USGS River Temp/Terror")
tab20 <- read.delim("USGS River Temp/Willow")
tab21 <- read.delim("USGS River Temp/Wolverine")
tab22 <- read.delim("USGS River Temp/Taiya")
tab23 <- read.delim("USGS River Temp/Indian R")
tab24 <- read.delim("Usgs River Temp/Staney")


# Remove first row of each data frame
tab1 <- tab1[-c(1), ,drop=FALSE]
tab2 <- tab2[-c(1), ,drop=FALSE]
tab3 <- tab3[-c(1), ,drop=FALSE]
tab4 <- tab4[-c(1), ,drop=FALSE]
tab5 <- tab5[-c(1), ,drop=FALSE]
tab6 <- tab6[-c(1), ,drop=FALSE]
tab7 <- tab7[-c(1), ,drop=FALSE]
tab8 <- tab8[-c(1), ,drop=FALSE]
tab9 <- tab9[-c(1), ,drop=FALSE]
tab10 <- tab10[-c(1), ,drop=FALSE]
tab11 <- tab11[-c(1), ,drop=FALSE]
tab12 <- tab12[-c(1), ,drop=FALSE]
tab13 <- tab13[-c(1), ,drop=FALSE]
tab14 <- tab14[-c(1), ,drop=FALSE]
tab15 <- tab15[-c(1), ,drop=FALSE]
tab16 <- tab16[-c(1), ,drop=FALSE]
tab17 <- tab17[-c(1), ,drop=FALSE]
tab18 <- tab18[-c(1), ,drop=FALSE]
tab19 <- tab19[-c(1), ,drop=FALSE]
tab20 <- tab20[-c(1), ,drop=FALSE]
tab21 <- tab21[-c(1), ,drop=FALSE]
tab22 <- tab22[-c(1), ,drop=FALSE]
tab23 <- tab23[-c(1), ,drop=FALSE]
tab24 <- tab24[-c(1), ,drop=FALSE]

# Can't use
  # tab23 - too short
  # tab22 - too short
  # tab21 - too short
  # tab20 - too short
  # tab17 - too short
  # tab16 - too short
  # tab14 - too short
  # tab13 - too short
  # tab12 - too short
  # tab10 - too short
  # tab9 - too short
  # tab8 - too short
  # tab7 - too many missing data values in each year
  # tab6 - too short
  # tab4 - too short
  # tab2 - too much of a gap between years
  # tab1 - too much of a gap between years


# Adjust duration of data because of gaps in years
tab24 <- tab24[which(tab24$year_nu<2020 & tab24$year_nu>=1998),]
tab5 <- tab5[which(tab5$year_nu>=2005),]

# Combine all data frames into a single data frame
tab <- rbind(tab3,tab5,tab15,tab19,tab24)

# List of site number
site <- as.numeric(as.matrix(unique(tab$site_no),ncol=1))

# tab <- rbind(tab3,tab5,tab11,tab15,tab18,tab19,tab22)
  # Tab3 -> Cooper -> Consistent data for months 6-10 starting 1999
  # Tab5 -> Kenai R - Cooper -> Consistent starting 2005
  # Tab11 -> Moose -> Consistent data for months 7-10 starting 2013
  # Tab15 -> Russell -> Consistent data for months 6-10 starting 1999
  # Tab18 -> Talkeetna -> Consistent data for months 6-10 starting 2012
  # Tab19 -> Terror -> Consistent data starting 1988
  # Tab22 -> Taiya -> Consistent data form months 7-9 starting 2004

# data frames that look good to sample
  # Characterisitcs I am looking for are
    # data longer than 10 years.
    # no gaps between years
# tab 3,5,11,15,18,19
# Maybe 2,4,7

# Reorganize data frame
df <- data.frame(tab$year_nu,tab$month_nu,tab$mean_va,tab$site_no)
colnames(df) <- c('year','month','SST','site #')

# Change character variable to numeric
df$year <- as.numeric(df$year)
df$month <- as.numeric(df$month)
df$SST <- as.numeric(df$SST)
df$`site #` <- as.numeric(df$`site #`)
df$date <- as.yearmon(df$year+df$month)

# Setting up plot frame
par(mfrow=c(1,1))
plot(df$date,df$SST)

# Label the sites by name of location
site.name <- c('Cooper Creek', 'Kenai River', 'Russell Creek',
               'Terror River', 'Staney Creek')

B <- data.frame(1:length(site))
A <- data.frame(1:length(site))
# Collect average point estimate for each data frame

for (i in site) {
  r <- which(site==i,arr.ind = TRUE)
avg.monthly.tab<- aggregate(SST[month>=6 & month<=9 & year>=1950 & `site #` == i]~
                              year[month>=6 & month<=9 & year>=1950 & `site #`==i],
                            data=df,FUN=mean)
colnames(avg.monthly.tab) <- c('year','SST')
slr <- lm(avg.monthly.tab$SST~avg.monthly.tab$year)
B[r,1] <- slr$coef['avg.monthly.tab$year']
A[r,1] <- slr$coef['(Intercept)']
plot(avg.monthly.tab$year,avg.monthly.tab$SST,
     ylab=TeX(r'(Temeperature ( $\degree$ C))'),
     xlab='Time (yrs)',
     family = 'playfair',
     cex.lab=1.3,
     cex=1.75,
     cex.axis=1.3
     # main=substitute(paste('Annual Water Temperature for ',
     #                       a),
     #                 list(a=site.name[r]))
     )
grid(NULL,NULL,col='lightgrey',lty=6)
legend('topleft',inset = .025,legend=c(site.name[r]),
       col=c('darkorange'), lty=1, cex=1
       )
points(avg.monthly.tab$year,avg.monthly.tab$SST,
       pch=19,
       cex=1.47,
       col=4
       )
abline(slr,lwd=5,col='darkorange')
}
glog <- median(B[1:nrow(B),]); glog
goog <- mean(B[1:nrow(B),]); goog
A.avg <- mean(A[1:nrow(A),]); A.avg

# Average of all the SST for each month
avg.monthly<- aggregate(SST[month>=6 & month<=9 & year>=1950]~
                          year[month>=6 & month<=9 & year>=1950],
                        data=df,FUN=mean)
colnames(avg.monthly) <- c('year','SST')

# Attach data frame for ease of use
attach(avg.monthly)

# Focus on spawning months
mon.begin <- 7
mon.end <- 9

# Plot data
slr <- lm(SST~year)
plot(year,SST,
     family = 'playfair',
     cex.lab=1.3,
     cex=1.75,
     cex.axis=1.3,
     ylab=TeX(r'(Temperature ( $\degree$ C))'),
     xlab='Time (Yrs)')
     # main='Average Annual Water Temperatures')
grid(NULL,NULL,col='lightgrey',lty=6)
points(year,SST,pch=19,cex=1.47,col=4)
abline(slr,lwd=5,col='darkorange')
B_T <- slr$coef['year']; B_T
A_T <- slr$coef['(Intercept)']; A_T
timevalues <- seq(1980,2040,.1)
lines(timevalues,goog*timevalues+A.avg,lwd=5,col='green',lty=2)
legend('topleft',inset=.025,legend=c('Avg. of Data','Avg. of Trends'),
       col=c('darkorange','green'),
       lty=c(1,2),
       cex=1.4
       )
# dynamic harmonic regression - fable library
goog
x <- seq(1988,2021,1)
y.sin <- 10^(-39.45)*exp(.045*x)*sin(10^(-4)*x^2-31)+B_T*x+A_T
lines(x,y.sin,
      col='red',
      lwd=2
      )

