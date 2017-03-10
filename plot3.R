library(data.table)
library(dplyr)

rawData <- fread("household_power_consumption.txt", na.strings = "?")
rawData <- mutate(rawData, Date = as.Date(Date, format = "%d/%m/%Y"))
rawData <- filter(rawData, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
rawData$DateTime <- as.POSIXlt(paste(rawData$Date, rawData$Time))
plot(rawData$DateTime, rawData$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(rawData$DateTime, rawData$Sub_metering_2, col="red")
lines(rawData$DateTime, rawData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()


