#Getting full dataset
data_all <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Date as Date
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

#Subsetting Data
data72 <- subset(data_all, Date >= "2007-02-01" & Date <= "2007-02-02")

#Checking for NA
data72_na <- data72[!complete.cases(data72),]
nrow(data72_na)

#Generating Plot 1
png("plot1.png", width=480, height=480)
hist(data72$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()