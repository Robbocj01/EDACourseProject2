# Code for Coursera EDA Course Project 4

# Loading required libraries
library(data.table)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

## Downloading and Extracting Datasets ##

# Download zip file containing datasets. Check to ensure it has not been already downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zipFilepath <- "dataFiles.zip"

if (!file.exists(zipFilepath)) {
    download.file(zipUrl, zipFilepath, mode = "wb")
}

unzip(zipFilepath)

