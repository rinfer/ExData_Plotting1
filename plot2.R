#Getting full dataset
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
dataplot <- subset(data72, select = Global_active_power)
dataplot_na <- dataplot[!complete.cases(dataplot),]
nrow(dataplot_na)

#Generating Plot 2
png("plot2.png", width=480, height=480)
plot(data72$DateTime, data72$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
