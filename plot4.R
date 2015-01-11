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
        
        # Set the grid in which plots are going to be created
        par(mfcol = c(2,2))
        
        # Create the plot with TimeStamp in x axis and Global active power in y.
        # Set the label for both axis and the type as "l" since we need a line
        # graph
        plot(x = plotData$TimeStamp, y = plotData$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
        
        # Create the plot for one variable first (Sub_metering_1) and set the 
        # labels for both axis as well as type.
        plot(x = plotData$TimeStamp, y = plotData$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
        
        # Now add lines for the two other variables (metering 2 & 3) along with
        # colors for the lines as required
        lines(plotData$TimeStamp, plotData$Sub_metering_2, col = "red")
        lines(plotData$TimeStamp, plotData$Sub_metering_3, col = "blue")
        
        # We now finish the plot with legends for the three variables. The 
        # legend color is displayed by default by an empty circle, we change it
        # to a line by adding line type for each variable in the legend using 
        # parameter lty and we also use parameter cex to resize the text in 
        # legend to keep the whole plot visible
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), cex = 0.5)
        
        # Create the plot with TimeStamp in x axis and Voltage in y.
        # Set the label for both axis and the type as "l" since we need a line
        # graph
        plot(x = plotData$TimeStamp, y = plotData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
        
        # Create the plot with TimeStamp in x axis and Global reactive power in y.
        # Set the label for both axis and the type as "l" since we need a line
        # graph. We also set the parameter yaxt = "n" to not print the numbers
        # along y-axis when the plot is generated. This is because assignment 
        # wants us to write labels at interval value of 0.1 and default printing
        # will happen at 0.2 interval for this graph
        plot(x = plotData$TimeStamp, y = plotData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", yaxt = "n")
        
        # Now we set the attributes of the y axis by defining the sequence and 
        # the interval in the sequence
        axis(2, at = seq(0.0, 0.5, by = 0.1), las = 1)
        
        
        # Close the graphics device.
        dev.off()
}

