# Call the common file getData.R to extract the data and provide the relevant 
# data object. getData.R provides a single function getData() with no arguments
# and returns and object of type data.frame
source("getData.R")

# This function calls the common function getData to get the data object that 
# needs to be used to generate the plot. Then using the data, it generates
# the plot required.
plot3 <- function() {
        # Get the data
        plotData <- getData()
        
        # Open the png device
        png("plot3.png")
        
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
        # parameter lty.
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
        
        # Close the graphics device.
        dev.off()
}

