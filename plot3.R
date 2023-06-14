# Define the file path for the data
dataFile <- "household_power_consumption.txt"

# Read the data from the file into a table
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data based on specific dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert the date and time columns into a datetime object
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert the "Global_active_power" column to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Convert the sub-metering columns to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Create a line plot showing sub-metering values over time
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
