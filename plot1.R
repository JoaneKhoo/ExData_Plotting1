library(data.table)
library(dplyr)

rawData <- fread("household_power_consumption.txt", na.strings = "?")
rawData <- mutate(rawData, Date = as.Date(Date, format = "%d/%m/%Y"))
rawData <- filter(rawData, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))
hist(rawData$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()