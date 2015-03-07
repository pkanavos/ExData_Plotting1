library(dplyr)
library(sqldf)

##Ensure English is used for day names, otherwise local names will appear on the graph
Sys.setlocale("LC_ALL", "English")
##Set the desired window size
windows.options(width=480, height=480)

## Load only data for the two dates
data<-read.csv.sql("household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')",sep=";",na.strings="?")
## Close the connection
sqldf()
##Add a datetime (dt) column from the values in Date and Time
dated<-mutate(data,dt=as.POSIXct(paste(Date ,Time),format="%d/%m/%Y %H:%M:%S"))

png("Plot2.png")
plot(dated$Global_active_power ~dated$dt ,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
