# loading required libraries

library(dplyr)
library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Load the NEI & SCC data frames from rds files

NEI <- readRDS("E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/Source_Classification_Code.rds")

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px")

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="magenta",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()