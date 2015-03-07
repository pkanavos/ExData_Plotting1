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
##Add a datetime column from the values in Date and Time
dated<-mutate(data,datetime=as.POSIXct(paste(Date ,Time),format="%d/%m/%Y %H:%M:%S"))

## Create the plot
png("plot3.png")
plot(dated$Sub_metering_1 ~dated$datetime ,type="l",ylab="Energy sub metering",xlab="")
lines(dated$Sub_metering_2 ~dated$datetime ,col="red")
lines(dated$Sub_metering_3 ~dated$datetime ,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
