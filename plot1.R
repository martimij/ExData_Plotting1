# Read data
data1<-read.csv2("household_power_consumption.txt", na.strings = "?", colClasses="character")

# Get only a subset of data for two specified days
data_sub <- rbind(data1[data1$Date == "1/2/2007",], data1[data1$Date == "2/2/2007",])

# Open a png device
png(filename="plot1.png", width = 480, height = 480)

# Create the histogram
hist(as.numeric(data_sub$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", breaks=15)

# Close the png device
dev.off()
