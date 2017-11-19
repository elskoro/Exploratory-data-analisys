library(dplyr)
setwd('~/Documents/R/Coursera/EDA/Project 1')
Sys.setlocale("LC_TIME", "en_US")

#Getting data
df <- read.table('household_power_consumption.txt', header = T, sep = ';',
                 stringsAsFactors = F, check.names = F, nrows=2075259, comment.char = '')
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df1 <- filter(df, Date=='2007-02-01')
df2 <- filter(df, Date=='2007-02-02')
df <- rbind(df1, df2)
remove(ACS, EDU, GDP, m, df1, df2)

######Plot 1#######

#Transforming 'Global_active_power' from factor to numeric
df$Global_active_power <- as.numeric(levels(df$Global_active_power))[df$Global_active_power]

#Actual plot
plot1 <- hist(df$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylab='Frequency', col = 'red')


###SAVING PLOT1####
png(width = 480, height = 480, 'Plot1.png')
hist(df$Global_active_power, main='Global Active Power',
              xlab='Global Active Power (kilowatts)', ylab='Frequency', col = 'red')
dev.off()


######Plot 2######

#Creating a single time column in the data
df$Days <- paste(df$Date, df$Time)
df$Days <- strptime(df$Days, format = '%Y-%m-%d %H:%M:%S')

#Actual plot
plot(df$Days, df$Global_active_power, type='l', 
     xlab='', ylab='Global Active Power (kilowatts)')

##SAVING PLOT2###
png(width = 480, height = 480, 'Plot2.png')
plot(df$Days, df$Global_active_power, type='l', 
     xlab='', ylab='Global Active Power (kilowatts)')
dev.off()



######Plot 3######

#Transforming factor columns into numeric
df$Sub_metering_1 <- as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2 <- as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]

#Actual plot
plot(df$Days, df$Sub_metering_1, type='l')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))

###SAVING PLOT 3#####
png(width = 480, height = 480, 'Plot3.png')
plot(df$Days, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))
dev.off()

###Plot 4###
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,1))
plot(df$Days, df$Global_active_power, type='l', 
     xlab='', ylab='Global Active Power')
plot(df$Days, df$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(df$Days, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))
plot(df$Days, df$Global_reactive_power, type='l', xlab='datetime', 
     ylab='Global_reactive_power')
 
###SAVING PLOT4#####
png(width = 480, height = 480, 'Plot4.png')
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,1))
plot(df$Days, df$Global_active_power, type='l', 
     xlab='', ylab='Global Active Power')
plot(df$Days, df$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(df$Days, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))
plot(df$Days, df$Global_reactive_power, type='l', xlab='datetime', 
     ylab='Global_reactive_power')
dev.off()
