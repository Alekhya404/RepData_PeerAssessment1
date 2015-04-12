dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]#extracting data for required dates
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)#extracting the Global_active_power data and making it as numeric values
GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)#extracting the Global_reactive_power data and making it as numeric values
date_time<-strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")# extracting particular date and time and days
voltage <- as.numeric(subsetdata$Voltage)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
##plotting 4 plots in the same file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(date_time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_time, submetering1, type="l", ylab="Energy Submetering", xlab="")
points(date_time, submetering2, type="l", col="red")
points(date_time, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(date_time, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()