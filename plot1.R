library(dplyr)
library(sqldf)

##Set the desired window size
windows.options(width=480, height=480)

## Load only data for the two dates
data<-read.csv.sql("household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",sep=";",na.strings="?")
## Close the connection
sqldf()

png("Plot1.png")
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
