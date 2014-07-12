## Coursera Exploratory Data Analysis
## Course Project 1
## plot2.R

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
png(filename="plot2.png", width=480, height=480)

# Plot
with(data, plot(Date, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Close png device
dev.off()
