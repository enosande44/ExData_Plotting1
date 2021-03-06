library(lubridate)
graphsDir<-".\\r\\coursera\\Eploratory Analysis\\Week 1\\Assignment"
setwd(graphsDir)
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "Fhousehold_power_consumption.zip")
unzip(zipfile = "Fhousehold_power_consumption.zip")
House_Power_Consumption<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
House_Power_Consumption$Date<-dmy(House_Power_Consumption$Date)
House_Power_Consumption_Subset<-subset(House_Power_Consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
House_Power_Consumption_Subset$Global_active_power<-as.numeric(paste(House_Power_Consumption_Subset$Global_active_power))
hist(House_Power_Consumption_Subset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()