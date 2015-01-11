# Call the common file getData.R to extract the data and provide the relevant 
# data object. getData.R provides a single function getData() with no arguments
# and returns and object of type data.frame
source("getData.R")

# This function calls the common function getData to get the data object that 
# needs to be used to generate the plot. Then using the data, it generates
# the plot required.
plot4 <- function() {
        # Get the data
        plotData <- getData()
        
        # Open the png device
        png("plot4.png")
        
        # Create the plots as required
        par(mfcol = c(2,2))
        
        plot(x = plotData$TimeStamp, y = plotData$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
        
        plot(x = plotData$TimeStamp, y = plotData$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
        lines(plotData$TimeStamp, plotData$Sub_metering_2, col = "red")
        lines(plotData$TimeStamp, plotData$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), cex = 0.5)
        
        plot(x = plotData$TimeStamp, y = plotData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
        
        plot(x = plotData$TimeStamp, y = plotData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", ylim = c(0.0, 0.5), yaxt = "n")
        axis(2, at = seq(0.0, 0.5, by = 0.1), las = 1)
        
        
        # Close the graphics device.
        dev.off()
}

