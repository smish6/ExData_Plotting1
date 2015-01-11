# This function is responsible for getting the data that is needed for the plots
# I have extracted this as a separate function, and then reused it in all four 
# files for the assignment as all files need to extract their own data.
#
# The activities done are described before each step below
getData <- function() {
        # Download the zip archive
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method = "curl")
        
        # Unzip the archive
        unzip("household_power_consumption.zip")
        
        # Read the full file
        housedata <- read.csv2("household_power_consumption.txt", sep = ";",
                               stringsAsFactors = FALSE)
        
        # Add a TimeStamp column to the data by combining Date and Time columns
        housedataplus <- transform(housedata, TimeStamp = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
        
        # Filter the data to contain rows for two dates only and copy the 
        # results to a new variable: filterdataplus
        filterdataplus <- filter(housedataplus, strptime("1/2/2007", format = "%d/%m/%Y") <= TimeStamp & TimeStamp < strptime("3/2/2007", format = "%d/%m/%Y"))
        
        # Return filterdataplus to the calling function
        filterdataplus
}