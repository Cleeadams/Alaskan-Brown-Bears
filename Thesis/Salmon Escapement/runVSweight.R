# Comparing run versus weight of sockeye salmon in bristol bay

setwd('C:/Users/Connor/OneDrive/Documents/Thesis/Salmon Escapement/Data')

rm(list = ls())

weight <- c(6.7,6.1,6.3,5.8,6.3,5.7,5.8,5.8,5.9,5.5,6.2,5.7,
           6,5.6,5.2,5.4,5.5,5.1,5.1,5.1,4.7)


run <- c(22.3,16.9,24.9,41.9,39.3,42.9,44.8,40.4,
         40.4,40.6,30.6,30.4,24.4,41.1,58.8,51.7,
         57.6,63,56.4,58.3,67.7)

df <- data.frame(weight,run)

colnames(df) <- c('Weight','Run')

cor(df$Weight,df$Run)


plot(df$Weight,df$Run,
     main = 'Sockeye Run Vs. Average Weight',
     xlab = 'Weight (lbs)',
     ylab = 'Run Size (mil)',
     cex = 2,
     col = 4,
     pch = 19,
     weight = 2,
     cex.main = 1.5,
     cex.lab = 1.5
     )

grid(NULL,NULL,col='lightgrey',lty=6)

points(df$Weight,df$Run,
     cex = 2,
     lwd = 2
     )

slr <- lm(Run~.,
          data = df
          )

abline(slr,
       lwd = 4,
       col = 'darkorange'
       )

df$Volume <- df$Weight*df$Run

df$'V (MMCF)' <- round(df$Volume / 43.8,2)

df

dfsub <- data.frame(seq(2001,2021),df$`V (MMCF)`)

write.csv(dfsub,'salmonvolume.csv',row.names = FALSE)
