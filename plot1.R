#Exploratory Data Analysis Course Project Plot 1

#reading data from file for required dates as mentioned in the Course Project(i.e.: 1/2/2007 and 2/2/2007)
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
class(data$Date1)

#converting the Date and Time columns to DateTime
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
#converting the Date to Date class
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

#PLOTTING GRAPH 1
## reading column global active power
x<- data$Global_active_power

#adjusting margin to make sure the labels are visible
par(mar= c(5,4,1,2))

#plotting histogram
hist(x, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")

#saving plot as png file
dev.copy(png, file = "plot1.png")

#closing png device
dev.off()
