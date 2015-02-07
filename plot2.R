#Exploratory Data Analysis Course Project Plot 2

#reading data from file for required dates as mentioned in the Course Project(i.e.: 1/2/2007 and 2/2/2007)
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
class(data$Date1)

#converting the Date and Time columns to DateTime
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
#converting the Date to Date class
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

#PLOTTING GRAPH 2
## reading column global active power and DateTime
x <- data$DateTime
y<- data$Global_active_power


#plotting linegraph
plot(x,y, type = "l", xlab="Global Active Power (kilowatts)")


#saving plot as png file
dev.copy(png, file = "plot2.png")

#closing png device
dev.off()
