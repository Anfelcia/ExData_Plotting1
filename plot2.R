# Subset the data based on specific dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert the date and time columns into a datetime object
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert the "Global_active_power" column to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create a line plot of the global active power over time
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
