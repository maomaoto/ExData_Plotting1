## Coursera Exploratory Data Analysis
## Course Project 1
## plot1.R

# assume the data set is in the working directory
data <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

# Get the observations of 2007-02-01 and 2007-02-02
data <- data[grepl("^[12]/2/2007", data$Date),]

# Create png device
png(filename="plot1.png", width=480, height=480)

# Draw histogram
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Close png device
dev.off()
