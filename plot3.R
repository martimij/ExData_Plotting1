# Read all data as character (to convert easily to numeric later)
data1<-read.csv2("household_power_consumption.txt", na.strings = "?", colClasses="character")

# Get the data subset (only 2 days)
data_sub <- rbind(data1[data1$Date == "1/2/2007",], data1[data1$Date == "2/2/2007",])

# Change the Time column to include the date
data_sub$Time <- paste(data_sub$Date, data_sub$Time)

# Convert the Time column into regular format
data_sub$Time <- strptime(data_sub$Time, format="%d/%m/%Y %H:%M:%S")

# Draw the graph (x,y plot) into a png file
png(filename="plot3.png", width = 480, height = 480)

# Draw an empty graph (data not showing)
plot(range(data_sub$Time), range(c(data_sub$Sub_metering_1)), ylab = "Energy sub metering", xlab = "", type="n")
# Add each dataset
lines(data_sub$Time, data_sub$Sub_metering_1)
lines(data_sub$Time, data_sub$Sub_metering_2, col="red")
lines(data_sub$Time, data_sub$Sub_metering_3, col="blue")
# Add legend
legend ("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lwd=1, col = c("black", "red", "blue"))

dev.off()
