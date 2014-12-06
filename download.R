#---------------------------------------------------------- 
# Data Science - Exploratory Data Analysis
# First Course Project Assignment 
# 
# This script is used to download and unzip the electric 
# power consumption dataset to the working directory.
#
# It is not part of the assignment but useful to set up
# the environment for subsequent plotting scripts.
#
# The download directory and the target file were added 
# to .gitignore manually to avoid uploading them to the 
# GitHub repository
#
## Extract from .gitignore
##
##  # Electric power consumption dataset
##  data/*
##  household_power_consumption.txt
#---------------------------------------------------------- 

# create download directory
dataDir <- "./data"
if (!file.exists(dataDir)) {dir.create(dataDir)}

# download web resource to target file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileRelPath <- paste0(dataDir,  "/exdata_data_household_power_consumption.zip")
download.file(fileUrl, destfile = fileRelPath, mode = "wb")

# extract contents of archive to the working directory
unzip(fileRelPath)

# clean up the environment
rm(dataDir, fileUrl, fileRelPath)

