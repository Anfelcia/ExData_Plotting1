# Define the file path for the data
dataFile <- "household_power_consumption.txt"

# Read the data from the file into a table
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data based on specific dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert the "Global_active_power" column to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create a histogram plot of the global active power
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
