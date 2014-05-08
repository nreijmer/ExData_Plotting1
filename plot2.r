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

#format the date and time
date <- as.Date(myData$Date, "%d/%m/%Y")
dateTime <- paste(date, myData$Time, sep=" ")
time <- strptime(dateTime, format="%Y-%m-%d %H:%M:%S")

#Set the general settings, number of graphs and the fontsize
par(mfrow=c(1,1))
par(cex=0.8)

#Create the linegraph
plot(time,myData$Global_active_power, 
        type="l", 
        xlab="",
        ylab="Global Active Power (kilowatts)",
        )

#Save the graph in plot2.png
dev.copy(png, "plot2.png")
dev.off()
