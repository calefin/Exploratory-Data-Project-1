# Set your work directory;
setwd("Your work directory")

# Read and Load data set;
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE, stringsAsFactors=F)

# Convert Data to class "Date";
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")

# Subset data to "Date >= "2007-02-01" | Date <= "2007-02-02"";
require(dplyr) #Using dplyr to subset

SubData <- filter(data, Date >= "2007-02-01", Date <= "2007-02-02")

# Create the png file named plot1.png

png(filename="plot1.png", width = 480, height = 480)

# Create the first plot

hist(SubData$Global_active_power, col = "red", 
         main = "Global Active Power", ylab = "Frequency", 
         xlab = "Global Active Power (kilowatts)")


# Save as a .png file dimension 480x480 pixels
dev.off()
