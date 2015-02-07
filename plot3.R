# Set your work directory;
setwd("Your work directory")

# Read and Load data set;
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, stringsAsFactors=F)

# Convert Data to class "Date";
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")

# Subset data to "Date >= "2007-02-01" | Date <= "2007-02-02"";
require(dplyr) #Using dplyr to subset

SubData <- filter(data, Date >= "2007-02-01", Date <= "2007-02-02")

# Date and Time vector of class POSIXlt

DateTime <- strptime(paste(SubData$Date, SubData$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

# Create the png file named plot3.png

png(filename="plot3.png", width = 480, height = 480)

# Create Plot 
with(SubData, {
        plot(DateTime, SubData$Sub_metering_1, type = "l",
             ylab = "Energy sub metering", 
             xlab = "", col = "black")
        lines(DateTime, SubData$Sub_metering_2, col = "red")
        lines(DateTime, SubData$Sub_metering_3, col = "blue")
        legend ("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
                col = c("black", "red", "blue"), lty = 1)
})

# Save as a .png file dimension 480x480 pixels
dev.off()
