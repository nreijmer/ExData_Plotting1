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

#Create a histogram
hist(myData$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power",
     col="red")

#Save the histogram as plot1.png
dev.copy(png, "plot1.png")
dev.off()