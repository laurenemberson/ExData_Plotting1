# Data Exploration Assignment #1:  Lauren Emberson June 4th 2014

# load the data with only the subset that we are interested in
library(sqldf)
data_Feb1 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date == "1/2/2007"',sep = ';')
data_Feb2 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date == "2/2/2007"',sep = ';')
data <- rbind(data_Feb1,data_Feb2)

# convert the date and time into something readable
data$Date <- as.POSIXct( strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

# save the plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# construct the plot
par(mfrow = c(2,2))
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Date, data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Date, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
