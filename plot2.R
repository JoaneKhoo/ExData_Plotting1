library(data.table)
library(dplyr)

rawData <- fread("household_power_consumption.txt", na.strings = "?")
rawData <- mutate(rawData, Date = as.Date(Date, format = "%d/%m/%Y"))
rawData <- filter(rawData, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
rawData$DateTime <- as.POSIXlt(paste(rawData$Date, rawData$Time))
plot(rawData$DateTime, rawData$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()


