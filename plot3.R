#Exploratory Data Analysis Course Project Plot 3

#reading data from file for required dates as mentioned in the Course Project(i.e.: 1/2/2007 and 2/2/2007)
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

#converting the Date and Time columns to DateTime
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
#converting the Date to Date class
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

#PLOTTING GRAPH 3
## reading and setting columns in new variables for  global sub metering and DateTime
x <- data$DateTime
submeter1 <- data$Sub_metering_1
submeter2 <- data$Sub_metering_2
submeter3 <- data$Sub_metering_3

#plotting linegraph
plot(x,submeter1, type = "n", ylab="Energy sub metering")
with(data, {
    points(x,submeter1, type="l", col="black")
    points(x,submeter2, type="l", col="red")
    points(x,submeter3, type="l", col="blue")
})

#setting legend on top right with expected color codes
legend("topright", lty= "solid",col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#saving plot as png file
dev.copy(png, file = "plot3.png")

#closing png device
dev.off()


