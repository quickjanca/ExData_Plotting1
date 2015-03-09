library(data.table)
PATH="D:/02 Kaggle/CTR/Rscripts/COurser Project 1/"
setwd(PATH)
getwd()

tmp<- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";",header = TRUE)
head(tmp)
tmp$Global_active_power<-as.numeric(tmp$Global_active_power)

hist(tmp$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)",col="red")
