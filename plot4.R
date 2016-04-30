## Getting full dataset
data_all <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Date as Date
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

#Subsetting Data
data72 <- subset(data_all, Date >= "2007-02-01" & Date <= "2007-02-02")

#Setting DateTime variable as PosXlt
data72$DateTime <- paste(data72$Date, data72$Time)
data72$DateTime <- strptime(data72$DateTime, format = "%Y-%m-%d %H:%M:%S")

#Checking for NA
dataplot <- subset(data72, select = c(Global_active_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))
dataplot_na <- dataplot[!complete.cases(dataplot),]
nrow(dataplot_na)

#Creating Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data72$DateTime, data72$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data72$DateTime, data72$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data72$DateTime, data72$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data72$DateTime, data72$Sub_metering_2, type="l", col="red")
lines(data72$DateTime, data72$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(data72$DateTime, data72$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
