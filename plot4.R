# Define the file path for the data
dataFile <- "household_power_consumption.txt"

# Read the data from the file into a table
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data based on specific dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert the date and time columns into a datetime object
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert various columns to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Create a multi-plot with four subplots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plot global active power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot voltage
plot(datetime, voltage, type="l", xlab="Datetime", ylab="Voltage")

# Plot sub-metering values
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot global reactive power
plot(datetime, globalReactivePower, type="l", xlab="Datetime", ylab="Global Reactive Power")

dev.off()
