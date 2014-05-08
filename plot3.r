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
par(mfrow=c(1,1))
par(cex=0.8)

#format the date and time
date <- as.Date(myData$Date, "%d/%m/%Y")
dateTime <- paste(date, myData$Time, sep=" ")
time <- strptime(dateTime, format="%Y-%m-%d %H:%M:%S")

#Create an empty plot
plot(time, 
     myData$Sub_metering_1, 
     xlab="",
     ylab="Energy sub metering",
     type="n")

#Create a line for each sub_metering column
lines(time, myData$Sub_metering_1)
lines(time, myData$Sub_metering_2, col="red")
lines(time, myData$Sub_metering_3, col="blue")

#Add the legend
legend("topright",
       lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save the graph in plot3.png
dev.copy(png, "plot3.png")
dev.off()