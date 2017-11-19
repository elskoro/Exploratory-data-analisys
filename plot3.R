#Getting data
setwd("~/Documents/R/Coursera/EDA/Project 1")
df <- read.table('household_power_consumption.txt', header = T, sep = ';')
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df1 <- filter(df, Date=='2007-02-01')
df2 <- filter(df, Date=='2007-02-02')
df <- rbind(df1, df2)
remove(df1, df2)
df$Days <- paste(df$Date, df$Time)
df$Days <- strptime(df$Days, format = '%Y-%m-%d %H:%M:%S')
df$Global_active_power <- as.numeric(levels(df$Global_active_power))[df$Global_active_power]
df$Sub_metering_1 <- as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2 <- as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]

#Actual plot
plot(df$Days, df$Sub_metering_1, type='l')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))


#Creating PNG
png(width = 480, height = 480, 'Plot3.png')
plot(df$Days, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(df$Days, df$Sub_metering_2, type='l', col='red')
lines(df$Days, df$Sub_metering_3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=c(1,1,1), col=c('black', 'red', 'blue'))
dev.off()
