# Code for Coursera EDA Course Project 4
# Plot 5

# Loading libraries
library(data.table)
library(ggplot2)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

# Load data files
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Extract motor vehicle related sources from the Source Classification Code Table
motorvehicle <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[motorvehicle,]

vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC$SCC,]

# Subset the vehicles NEI data to extract Baltimore
baltimoreVehiclesNEI <- vehiclesNEI[fips=="24510",]

png("plot5.png",width=750, height=500)

ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions, fill = year)) +
    geom_bar(stat="identity" ,width=0.75) +
    labs(x="Year", y=expression("Total PM2.5 Emission (Tons)")) + 
    labs(title=expression("PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
