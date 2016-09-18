## --------------------------------------------
## Exploratory Data Analysis - Course Project 1
## Plot 1
## --------------------------------------------

## Read in the data
power<-read.csv("C:/Users/Mooney/Desktop/Coursera/household_power_consumption.txt", header = TRUE, 
                sep=";", na.strings = "?")

## Create a column DateTime, which combines the date and time information
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M") 

## Set Date variable as a date data type
power$Date<-as.Date(as.factor(power$Date), "%d/%m/%Y")

## Fixing the two dates to be used for analysis
date1<-as.Date("2007/02/01")
date2<-as.Date("2007/02/02")
power.sub <- power[power$Date >= date1 & power$Date <= date2, ]

## Set Global_active_power variable as a numeric value for analysis
power.sub$Global_active_power<-as.numeric(power.sub$Global_active_power)

## Creating a histogram, with title "Global Active Power", x-axis label "Global Active Power (kilowatts)",
## and histogram bars colored red
hist(power.sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")