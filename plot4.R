#Exploratory Data Analysis Course Project Plot4

#reading data from file for required dates as mentioned in the Course Project(i.e.: 1/2/2007 and 2/2/2007)
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

#converting the Date and Time columns to DateTime
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
#converting the Date to Date class
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

#PLOTTING GRAPH 4
## reading column DateTime and global active power
x <- data$DateTime

#setting plots into 2 rows and 2 columns and background as white
par(mfrow= c(2,2),bg="white")
# plotting each graph in required order
with(data, {
    
    plot(x,data$Global_active_power, type="l", col="black",xlab="",ylab="Global Active Power")
    plot(x,data$Voltage, type="l", col="black",xlab="datetime",ylab="Voltage")
    plot(x,data$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
    with(data, {
        points(x,data$Sub_metering_1, type="l", col="black")
        points(x,data$Sub_metering_2, type="l", col="red")
        points(x,data$Sub_metering_3, type="l", col="blue")
    })
    plot(x,data$Global_reactive_power, type="l", col="black", xlab="datetime",ylab="Global_reactive_power")
})

#saving plot as png file
dev.copy(png, file = "plot4.png")

#closing png device
dev.off()


