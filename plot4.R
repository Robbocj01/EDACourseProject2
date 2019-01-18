# Code for Coursera EDA Course Project 4
# Plot 4

# Loading libraries
library(data.table)
library(ggplot2)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

# Load data files
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Extract coal combustion-related sources from the Source Classification Code Table
combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustionSCC <- SCC[combustion.coal,]

# Subset NEI table
combustionNEI <- NEI[NEI$SCC %in% combustionSCC$SCC]

#Plot combustion data
png("plot4.png",width=750, height=500)

ggplot(combustionNEI,aes(x = factor(year),fill = year,y = Emissions/1000)) +
    geom_bar(stat="identity", width=0.75) +
    labs(x="year", y=expression("Total PM205 Emission (Tons)")) + 
    labs(title=expression("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()

