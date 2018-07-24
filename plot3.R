PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, submetering2, col="red")
lines(datetime, submetering3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd = 2.5)
dev.off()

