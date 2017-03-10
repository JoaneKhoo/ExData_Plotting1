library(data.table)
library(dplyr)

rawData <- fread("household_power_consumption.txt", na.strings = "?")
rawData <- mutate(rawData, Date = as.Date(Date, format = "%d/%m/%Y"))
rawData <- filter(rawData, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
rawData$DateTime <- as.POSIXlt(paste(rawData$Date, rawData$Time))

par(mfrow=c(2,2))

with(rawData,
     {
       plot(rawData$DateTime, rawData$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
       plot(rawData$DateTime, rawData$Voltage, type = "l", xlab="datetime", ylab="Voltage")
       plot(DateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
       lines(DateTime, Sub_metering_2, col="red")
       lines(DateTime, Sub_metering_3, col="blue")
       legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), y.intersp=0.6, cex=0.7)
       plot(rawData$DateTime, rawData$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
     }
     )
dev.copy(png, file="plot4.png")
dev.off()