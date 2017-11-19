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
hist(df$Global_active_power, main='Global Active Power',
              xlab='Global Active Power (kilowatts)', ylab='Frequency', col = 'red')


#Creating PNG
png(width = 480, height = 480, 'Plot1.png')
hist(df$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylab='Frequency', col = 'red')
dev.off()