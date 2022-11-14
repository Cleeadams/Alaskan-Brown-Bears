# Comparing run versus weight of sockeye salmon in Bristol Bay

setwd('C:/Users/Connor/OneDrive/Desktop/GitHub/Alaskan-Brown-Bears/R/Salmon Escapement/Data')

rm(list = ls())

# Average Weight of Salmon During Annual Run
weight <- c(6.7,6.1,6.3,5.8,6.3,5.7,5.8,5.8,5.9,5.5,6.2,5.7,
           6,5.6,5.2,5.4,5.5,5.1,5.1,5.1,4.7)

# Run Size During Annual Run
run <- c(22.3,16.9,24.9,41.9,39.3,42.9,44.8,40.4,
         40.4,40.6,30.6,30.4,24.4,41.1,58.8,51.7,
         57.6,63,56.4,58.3,67.7)

# Constructs Dataframe
df <- data.frame(weight,run)

colnames(df) <- c('Weight','Run')

# Calculates The Correlation Between The Two Variables
cor(df$Weight,df$Run)

# Scatter Plot of The Two Variables
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

# Linear Regression Model
slr <- lm(Run~.,
          data = df
          )

# Graphs the Line on the Plot
abline(slr,
       lwd = 4,
       col = 'darkorange'
       )

# Calculates the Volume of Salmon Per Run
df$Volume <- df$Weight*df$Run

df$'V (MMCF)' <- round(df$Volume / 43.8,2)

df

# Constructs a Table with All Three Varaibles
dfsub <- data.frame(seq(2001,2021),df$`V (MMCF)`)

write.csv(dfsub,'salmonvolume.csv',row.names = FALSE)
