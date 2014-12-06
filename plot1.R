#---------------------------------------------------------- 
# Data Science - Exploratory Data Analysis
# First Course Project Assignment - 1st Plot
#
# This R script will read data for the period February 1 to
# February 2, 2007 from the electric power consumption dataset 
# contained in the file household_power_consumption.txt in 
# order to produce the first PNG plot.
# 
# Prerequisites:
# --------------
# This script requires the input file to be present in the
# working directory (The script download.R took care of that).
#---------------------------------------------------------- 

# The assignment explicitly requested the code to read the
# input file and transform the data frame to be present in 
# each of the four scripts. So please excuse the awkward 
# repetition.

# Inspection of the input file showed that all data for
# the required period were in a contiguous block starting
# at line 66637. To avoid reading the whole file, all data
# lines are read by skipping to line 66637 and then reading 
# the 2880 rows of interest. The lost header line is added
# with the col.names parameter. 
# Alternatively the whole file could be read and subsetted 
# to the period of interest afterwards.

# Date and Time are will not be used in the histogram so 
# date and time conversion is skipped for this plot

dataSubset <- read.table( 
                "./household_power_consumption.txt"
              , header = FALSE
              , sep = ";"
              , col.names = c( "Date"
                             , "Time"
                             , "Global_active_power"
                             , "Global_reactive_power"
                             , "Voltage"
                             , "Global_intensity"
                             , "Sub_metering_1"
                             , "Sub_metering_2"
                             , "Sub_metering_3"
                             )
              , colClasses = c( "character"
                              , "character"
                              , "numeric"
                              , "numeric"
                              , "numeric"
                              , "numeric"
                              , "numeric"
                              , "numeric"
                              , "numeric"
                              )
              , skip = 66637
              , nrows = 2880
              , na.strings = "?"
              )

# opening the PNG graphics device and associating
# it with an output file of the required dimensions.
# The original files in the figure subdirectory 
# have transparent background color, but I choose 
# a white backgroud here , because this resembles more 
# closely the presentation of the master plots.

png( file = "plot1.png"
   , width = 480
   , height = 480
   , units = "px"
   , bg = "white"
   )

# drawing the histogram on the PNG device
# overwriting some of the defaults

hist( dataSubset$Global_active_power
    , col = "Red"
    , xlab = "Global Active Power (kilowatts)"
    , main = "Global Active Power"
    )

# close the PNG device and save the output file
dev.off()

# cleaning up the environment
rm(dataSubset)

