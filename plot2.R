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

# Create the png file named plot2.png

png(filename="plot2.png", width = 480, height = 480)

# Create the plot

plot(DateTime, SubData$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Save as a .png file dimension 480x480 pixels
dev.off()
