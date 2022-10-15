

# 1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Import data from rds file

file_name <- "E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/summarySCC_PM25.rds"
data <- readRDS(file_name)

# Calculate total PM2.5 emissions for each year

emi_year <- data %>% group_by(year) %>% summarise(total = sum(Emissions))

# Plotting the data 

png("plot1.png",width=480,height=480,units = "px")

plot1 <- barplot(emi_year$total/1000, main = "Total PM2.5 Emissions", 
                 xlab = "Year", ylab = "PM2.5 Emissions in Kilotons", 
                 names.arg = emi_year$year, col = "blue", ylim = c(0,8300))

text(plot1, round(emi_year$total/1000), label = round(emi_year$total/1000), 
     pos = 3, cex = 1.2)

dev.off()