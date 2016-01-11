#Title		: Project 1 - plot3
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

# Create plot3 with the desired labels, colors for Global_active_power and days of the week.
with(data, {
  plot(Sub_metering_1~daysOfTheWeek, type="l", ylab="Energy sub metering", xlab="",col='Black')
  lines(Sub_metering_2~daysOfTheWeek,col='Red')
  lines(Sub_metering_3~daysOfTheWeek,col='Blue')
  # Add legends to the plot.
  legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Copy the plot to plot3.png file.
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()