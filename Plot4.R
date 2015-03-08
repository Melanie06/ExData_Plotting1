## Hello :)
## File 'household_power_consumption.txt' must be in the working directory 


# Read all Data
Data<- read.delim(   'household_power_consumption.txt', 
                     header=TRUE,
                     na.strings = "?",
                     sep = ";"    )

# Select Data from the dates 2007-02-01 and 2007-02-02
subsetData <- subset(   Data, 
                        Data$Date %in% c("1/2/2007","2/2/2007")    )

dateTime <- strptime(   paste(subsetData[,1]," ",subsetData[,2]),
                        "%d/%m/%Y %H:%M:%S"    )
p2 <- data.frame(   Global_active_power = subsetData$Global_active_power,
                    Date_Time=dateTime    )
p3 <- data.frame(   Sub_metering_1 = subsetData$Sub_metering_1,
                    Sub_metering_2 = subsetData$Sub_metering_2,
                    Sub_metering_3 = subsetData$Sub_metering_3,
                    Date_Time=dateTime    )

p4 <- data.frame(   Global_reactive_power = subsetData$Global_reactive_power,
                    Voltage = subsetData$Voltage,
                    Date_Time=dateTime    )

## 4 plots 
par(    mfrow = c(2, 2))

## Plot 1,1
with(    p2,
         plot(   Date_Time, 
                 Global_active_power, 
                 xlab="",
                 ylab = "Global Active Power (kilowatts)", 
                 type="l"    )    )

## Plot 1,2
with(   p4,
        plot(   Date_Time, 
                Voltage, 
                xlab = "DateTime", 
                ylab = "Voltage", 
                type="l"    )    )

## Plot 2,1

plot(   p3$Date_Time, 
        p3$Sub_metering_1,
        xlab="", 
        ylab = "Energy sub metering",
        type="l",
        col = "black"    )

lines(  p3$Date_Time, 
        p3$Sub_metering_2,
        col = "red"    )

lines(  p3$Date_Time, 
        p3$Sub_metering_3,
        col = "blue"    )

legend( "topright",
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1),
        bty="n",
        cex=.50)


## Plot 2,2
with(   p4,
        plot(   Date_Time, 
                Global_reactive_power, 
                xlab = "DateTime", 
                ylab = "Global_reactive_power", 
                type="l" ) )

## Save to PNG
dev.copy(   png, 
            file = "Plot4.png",
            width=480, 
            height=480 )

dev.off()
