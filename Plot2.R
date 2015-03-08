

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

p2 <- data.frame(    Global_active_power = subsetData$Global_active_power,
                            Date_Time=dateTime    )

## Plot
with(    p2,
         plot(   Date_Time, 
                 Global_active_power, 
                 xlab="",
                 ylab = "Global Active Power (kilowatts)", 
                 type="l"    )    )


## Save to PNG
dev.copy(   png, 
            file = "Plot2.png",
            width=480, 
            height=480    )

dev.off()
