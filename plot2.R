data1<-read.csv2("household_power_consumption.txt", na.strings = "?", colClasses="character")

data_sub <- rbind(data1[data1$Date == "1/2/2007",], data1[data1$Date == "2/2/2007",])

# Change the Time column to include the date
data_sub$Time <- paste(data_sub$Date, data_sub$Time)

# Convert the Time column into regular format
data_sub$Time <- strptime(data_sub$Time, format="%d/%m/%Y %H:%M:%S")

# Draw the graph into a file
png(filename="plot2.png", width = 480, height = 480)
plot (data_sub$Time, as.numeric(data_sub$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
