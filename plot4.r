#load the sqldf package
require("sqldf")

#Set the work directory
setwd("D:/Tue/Coursera/datascience/exploratory/");

#Create a query to select only the required dates
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
#Set the filename
myFile <- "household_power_consumption.txt"

#Get the required data
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

#Set the general settings, number of graphs and the fontsize
par(mfrow=c(2,2))
par(cex=0.8)

#format the date and time
date <- as.Date(myData$Date, "%d/%m/%Y")
dateTime <- paste(date, myData$Time, sep=" ")
time <- strptime(dateTime, format="%Y-%m-%d %H:%M:%S")

#Plot the first graph (topleft)
plot(time,myData$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power")

#Plot the second graph (topright)
plot(time,myData$Voltage,      
     type="l",
     xlab="datetime",
     ylab="Voltage")

#Create an empty plot (bottomleft)
plot(time, myData$Sub_metering_1, 
     type="n",
     xlab ="",
     ylab="Energy sub metering")

#Create a line for each sub_metering column
lines(time, myData$Sub_metering_1)
lines(time, myData$Sub_metering_2, col="red")
lines(time, myData$Sub_metering_3, col="blue")
#Add the legend
legend("topright",lwd=1, col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot the fourth graph (bottomright)
plot(time, myData$Global_reactive_power,  
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

#Save the plot in plot4.png
dev.copy(png, "plot4.png")
dev.off()