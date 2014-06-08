# Data Exploration Assignment #1:  Lauren Emberson June 4th 2014

# load the data with only the subset that we are interested in
library(sqldf)
data_Feb1 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date == "1/2/2007"',sep = ';')
data_Feb2 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date == "2/2/2007"',sep = ';')
data <- rbind(data_Feb1,data_Feb2)

# convert the date and time into something readable
data$Date <- as.POSIXct( strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

# open the file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# construct the plot 
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# shut 'er down
dev.off()
