#2 PNG and R Code file
setwd("D:/Personal/SCML/To do/Coursera/Data Science/4.ExploratoryDataAnalysis/1.WeekOne")
getwd()
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dateTime <- paste(t$Date, t$Time)
dateTime <- setNames(dateTime, "DateTime")
t <- t[ ,!(names(t) %in% c("Date","Time"))]
t <- cbind(dateTime, t)
t$dateTime <- as.POSIXct(dateTime)

## PLOT 2
plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

