
# loading required libraries

library(dplyr)
library(ggplot2)

# 4 Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Load the NEI & SCC data frames from rds files

NEI <- readRDS("E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/Source_Classification_Code.rds")

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px")

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="green",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()


