# Code for Coursera EDA Course Project 4
# Plot 3

# Loading libraries
library(data.table)
library(ggplot2)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

# Load data files
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Subset NEI data by Baltimore
baltimoreNEI <- NEI[fips=="24510",]

png(filename='plot3.png', width=1000, height=500)

ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type),label = round(Emissions,2)) +
    geom_bar(stat="identity") +
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="Year", y=expression("Total PM2.5 Emission (Tons)")) + 
    labs(title=expression("PM2.5 Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
