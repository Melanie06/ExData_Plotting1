

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

p3<- data.frame(  Sub_metering_1 = subsetData$Sub_metering_1,
                          Sub_metering_2 = subsetData$Sub_metering_2,
                          Sub_metering_3 = subsetData$Sub_metering_3,
                          Date_Time=dateTime    )

## Plot data

plot(   p3$Date_Time, 
        p3$Sub_metering_1,
        xlab="", 
        ylab = "Energy sub metering",
        type="l",
        col = "black"  
        )

lines(  p3$Date_Time, 
        p3$Sub_metering_2,
        col = "red"    )

lines(  p3$Date_Time, 
        p3$Sub_metering_3,
        col = "blue"    )

legend( "topright",
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1))

## Save to PNG
dev.copy(    png, 
             file = "Plot3.png",
             width=480, 
             height=480    )

dev.off()
