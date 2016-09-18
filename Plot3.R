## --------------------------------------------
## Exploratory Data Analysis - Course Project 1
## Plot 3
## --------------------------------------------

## Read in the data
power<-read.csv("C:/Users/Mooney/Desktop/Coursera/household_power_consumption.txt", header = TRUE, 
                sep=";", na.strings = "?")

## Set Date variable as a date data type
power$Date<-as.Date(as.factor(power$Date), "%d/%m/%Y")

## Fixing the two dates to be used for analysis
date1<-as.Date("2007/02/01")
date2<-as.Date("2007/02/02")
power.sub <- power[power$Date >= date1 & power$Date <= date2, ]

## Set Global_active_power variable as a numeric value for analysis
power.sub$Global_active_power<-as.numeric(power.sub$Global_active_power)

## Create a column DateTime, which combines the date and time information
DateTime <- paste(as.Date(power.sub$Date), power.sub$Time)
power.sub$DateTime <- as.POSIXct(DateTime)

## Graphing sub_metering variables together (y) vs. DateTime (x)
with(power.sub, {
  with(power.sub, plot(power.sub$DateTime, power.sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  lines(power.sub$Sub_metering_2 ~ power.sub$DateTime, col = "Red")
  lines(power.sub$Sub_metering_3 ~ power.sub$DateTime, col = "Blue")
})

## Affixing legend to the chart
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))