data1<-read.csv2("household_power_consumption.txt", na.strings = "?", colClasses="character")

data_sub <- rbind(data1[data1$Date == "1/2/2007",], data1[data1$Date == "2/2/2007",])

# Change the Time column to include the date
data_sub$Time <- paste(data_sub$Date, data_sub$Time)

# Convert the Time column into regular format
data_sub$Time <- strptime(data_sub$Time, format="%d/%m/%Y %H:%M:%S")

# Open a png device
png(filename="plot4.png", width = 480, height = 480)

# Create space for 4 graphs
par(mfrow = c(2,2))
par(mar= c(6,4,2,2))

# Plot 1st graph
plot (data_sub$Time, as.numeric(data_sub$Global_active_power), type="l", ylab = "Global Active Power", xlab = "")

# Plot 2nd graph
plot (data_sub$Time, as.numeric(data_sub$Voltage), type="l", ylab = "Voltage", xlab = "datetime")

# Plot 3rd graph
plot(range(data_sub$Time), range(c(data_sub$Sub_metering_1)), ylab = "Energy sub metering", xlab = "", type="n")
lines(data_sub$Time, data_sub$Sub_metering_1)
lines(data_sub$Time, data_sub$Sub_metering_2, col="red")
lines(data_sub$Time, data_sub$Sub_metering_3, col="blue")
legend ("topright", bty="n", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lwd=1, col = c("black", "red", "blue"))

# Plot 4th graph
plot (data_sub$Time, as.numeric(data_sub$Global_reactive_power), type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
