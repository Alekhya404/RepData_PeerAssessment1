dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]#extracting data for required dates
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)#extracting the Global_active_power data and making it as numeric values
png("plot1.png", width=480, height=480)#creating a png file with required specifications
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


