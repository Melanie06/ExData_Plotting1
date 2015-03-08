

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

## Plot
with(    subsetData, 
         hist(   Global_active_power, 
                 col = "red",
                 main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)"    )    )

## Save figure to PNG
dev.copy(    png, 
             file = "Plot1.png",
             width=480, 
             height=480    )

dev.off()

