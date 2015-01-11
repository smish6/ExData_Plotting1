# Call the common file getData.R to extract the data and provide the relevant 
# data object. getData.R provides a single function getData() with no arguments
# and returns and object of type data.frame
source("getData.R")

# This function calls the common function getData to get the data object that 
# needs to be used to generate the plot. Then using the data, it generates
# the plot required.
plot2 <- function() {
        # Get the data
        plotData <- getData()
        
        # Open the png device
        png("plot2.png")
        
        # Create the plot with TimeStamp in x axis and Global active power in y.
        # Set the label for both axis and the type as "l" since we need a line
        # graph
        plot(x = plotData$TimeStamp, y = plotData$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
        
        # Close the graphics device.
        dev.off()
}

