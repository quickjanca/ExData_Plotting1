library(data.table)
PATH="D:/01 Coursera/Specializace/DataScience/Course4-Explonatory Data Analysis/CourseProject1/"
setwd(PATH)
getwd()

data2 <- read.csv("household_power_consumption.txt", header = T, sep = ';',stringsAsFactors = F) 
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")

head(data2)

tmp <- subset(data2, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(tmp)

datetime <- paste(as.Date(tmp$Date), tmp$Time)
tmp$datetime <- as.POSIXct(datetime)

plot(tmp$datetime,tmp$Global_active_power, type='l',
     ylab = "Global Active Power (kilowatts)", xlab = "")

