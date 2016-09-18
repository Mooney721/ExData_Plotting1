## --------------------------------------------
## Exploratory Data Analysis - Course Project 1
## Plot 2
## --------------------------------------------

## Read in the data
power<-read.csv("C:/Users/Mooney/Desktop/Coursera/household_power_consumption.txt", header = TRUE, 
                sep=";", na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, 
                comment.char = "",quote = '\"')

## Set Date variable as a date data type
power$Date<-as.Date(as.factor(power$Date), "%d/%m/%Y")

## Fixing the two dates to be used for analysis
date1<-as.Date("2007/02/01")
date2<-as.Date("2007/02/02")
power.sub <- power[power$Date >= date1 & power$Date <= date2, ]

## Create a column DateTime, which combines the date and time information
DateTime <- paste(as.Date(power.sub$Date), power.sub$Time)
power.sub$DateTime <- as.POSIXct(DateTime)

## Set variables as numeric values for analysis
power.sub$Global_active_power<-as.numeric(power.sub$Global_active_power)
power.sub$Global_reactive_power<-as.numeric(power.sub$Global_reactive_power)
power.sub$Global_reactive_power<-as.numeric(power.sub$Global_reactive_power)

## Plotting 4 charts
par(mfrow = c(2,2))
with(power.sub, plot(power.sub$DateTime, power.sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
lines(power.sub$DateTime, power.sub$Global_active_power)
with(power.sub, plot(power.sub$DateTime, power.sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
lines(power.sub$DateTime, power.sub$Voltage)
with(power.sub, {
  with(power.sub, plot(power.sub$DateTime, power.sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  lines(power.sub$Sub_metering_2 ~ power.sub$DateTime, col = "Red")
  lines(power.sub$Sub_metering_3 ~ power.sub$DateTime, col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), bty = "n", lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(power.sub, plot(power.sub$DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
lines(power.sub$DateTime, power.sub$Global_reactive_power)