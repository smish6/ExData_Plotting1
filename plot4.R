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
        
        # Create the plot as required
        par(mfcol = c(2,2))
        hist(as.numeric(plotData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
        
        # Close the graphics device.
        dev.off()
}

