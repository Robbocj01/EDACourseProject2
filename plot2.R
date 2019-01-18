# Code for Coursera EDA Course Project 4
# Plot 2

# Loading libraries
library(data.table)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

# Load data files
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Calculate total PM2.5 by year for Maryland
totalNEI <- NEI[fips=='24510', lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

png(filename='plot2.png',width=750, height=500)

# Create barplot
# Prevents histogram from printing in scientific notation 
opt <- options("scipen" = 20)
getOption("scipen")

# Create barplot
clrs <- c("green", "red", "blue", "yellow")
barplot(totalNEI$Emissions, name = totalNEI$year,
        xlab = "Years", ylab = "Total PM2.5 Emissions (Tons)",
        main = "Total Baltimore City, Maryland PM2.5 Emissions over the Years (Tons)", 
        col = clrs)

# Adjust ylab to be numeric
options(opt)

dev.off()