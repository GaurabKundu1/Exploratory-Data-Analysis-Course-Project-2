

# 2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Import data from rds file

file_name <- "E:/JOHNS HOPKINS UNIVERSITY/Data Science Specialization/4 Exploratory Data Analysis/Course Project/Week 4/exdata_data_NEI_data/summarySCC_PM25.rds"
data <- readRDS(file_name)

# Calculate total emissions for Baltimore City

emi_balt <- data %>% group_by(year) %>% filter(fips == "24510") %>% 
  summarise(total = sum(Emissions))

# Plotting Baltimore City emissions per year

png("plot2.png",width=480,height=480,units = "px")

plot2 <- barplot(emi_balt$total, 
                 main = "Total PM2.5 Emissions in Baltimore City, Maryland", 
                 xlab = "Year", ylab = "PM2.5 Emissions in Tons", 
                 names.arg = emi_balt$year, col = "red", ylim = c(0,3600))

text(plot2, round(emi_balt$total), label = round(emi_balt$total), 
     pos = 3, cex = 1.2)

dev.off()