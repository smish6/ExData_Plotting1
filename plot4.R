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
        
        # Create the histogram for the Global Active Power variable. Convert the
        # variable to numeric for the plot. Add the title through main parameter.
        # Add X-lable through xlab and color to the bars through col parameters.
        hist(as.numeric(plotData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
        
        # Close the graphics device.
        dev.off()
}

