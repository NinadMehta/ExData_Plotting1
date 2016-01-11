#Title		: Project 1 - plot1
#Author		: Ninad Mehta
#Date		: 1/10/2016

# Copy the dataset 'household_power_consumption.txt' into working directory where you will run this code. 
# Getting full dataset
completeData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Filter completeData to fetch the data for two days only.
data <- subset(completeData, subset=(as.Date(Date, format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date, format="%d/%m/%Y") <= "2007-02-02"))

# Remove the unwanted copy of the large file.
rm(completeData)

# Create plot1 with the desired title, labels and color for Global_active_power.
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")

# Copy the plot to plot1.png file.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()