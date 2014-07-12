## Coursera Exploratory Data Analysis
## Course Project 1
## plot4.R

# Assume the data set is in the working directory
data <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

# Get the observations of 2007-02-01 and 2007-02-02
data <- data[grepl("^[12]/2/2007", data$Date),]

# Set locale for plot display
Sys.setlocale("LC_TIME", "C")

# transform character into time format
data <- transform(data, Date = paste(Date, Time))
data <- transform(data, Date = strptime(Date, format="%d/%m/%Y %H:%M:%S"))

# Create png device
png(filename="plot4.png", width=480, height=480)

# Set 2x2 array
par(mfcol=c(2,2))

# Plot global active power
with(data, plot(Date, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

# Plot energy sub metering
with(data, plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Date, Sub_metering_2, type="l", col="red"))
with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=colnames(data)[7:9], bty="n")

# Plot voltage
with(data, plot(Date, Voltage, type="l", xlab="datetime"))

# Plot global reactive power
with(data, plot(Date, Global_reactive_power, type="l", xlab="datetime"))

# Close png device
dev.off()

