# Code for Coursera EDA Course Project 4
# Plot 6

# Loading libraries
library(data.table)
library(ggplot2)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject2")

# Load data files
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# Extract motor vehicle sources from the Source Classification Code Table
motorvehicle <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case=TRUE)
vehiclesSCC <- SCC[motorvehicle,]

vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC$SCC,]

# Extract Balitmore and Los Angeles data and combine into one dataset
baltimoreVehiclesNEI <- vehiclesNEI[fips=="24510",]
losangelesVehiclesNEI <- vehiclesNEI[fips=="06037",]

baltimoreVehiclesNEI$City <- "Baltimore City, MD"
losangelesVehiclesNEI$City<- "Los Angeles County, CA"

combinedNEI <- rbind(baltimoreVehiclesNEI, losangelesVehiclesNEI)

# Plot comparison chart
png("plot6.png",width=750, height=1000)


ggplot(combinedNEI, aes(x=factor(year), y=Emissions, fill=City)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(City~., scales="free") +
    ylab(expression("total PM2.5 emissions in tons")) + 
    xlab("Year") +
    ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))

dev.off()
