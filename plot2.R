#Title		: Project 1 - plot2
#Author		: Ninad Mehta
#Date		: 1/10/2016

# Copy the dataset 'household_power_consumption.txt' into working directory where you will run this code. 
# Getting full dataset
completeData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Filter completeData to fetch the data for two days only.
data <- subset(completeData, subset=(as.Date(Date, format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date, format="%d/%m/%Y") <= "2007-02-02"))

# Remove the unwanted copy of the large file.
rm(completeData)

# Converting dates to character days (e.g.Thu, Fri, etc.).
daysOfTheWeek <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time))

# Create plot2 with the desired labels for Global_active_power and days of the week.
plot(data$Global_active_power~daysOfTheWeek, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Copy the plot to plot2.png file.
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()