## Coursera Exploratory Data Analysis
## Course Project 1

# assume the data set is in same directory
data <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")

data <- data[,grepl("{01|02}/02/2007", data$)]