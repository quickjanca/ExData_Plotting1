library(data.table)
PATH="D:/01 Coursera/Specializace/DataScience/Course4-Explonatory Data Analysis/CourseProject1/"
setwd(PATH)
getwd()

data2 <- read.csv("household_power_consumption.txt", nrows = 2075259, check.names = F, 
                  stringsAsFactors = F,  sep = ';') 
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
tmp <- subset(data2, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(tmp$Date), tmp$Time)
tmp$datetime <- as.POSIXct(datetime)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(tmp, {
  plot(datetime,Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(datetime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(datetime,Sub_metering_1, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(datetime,Sub_metering_2, col = 'Red')
  lines(datetime,Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,Global_reactive_power, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
