# Code to load cleaned dataset
powerSubset <- read.table(file="powerSubset.txt", header=TRUE, sep=",", stringsAsFactors = F)
powerSubset$Date <- as.Date(powerSubset$Date, "%Y-%m-%d")
powerSubset$dateTime <- strptime(powerSubset$dateTime, "%Y-%m-%d %H:%M:%S")

# Code to create plots and output PNG file

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(powerSubset, plot(dateTime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))
with(powerSubset, plot(dateTime, Voltage, type="l", ylab="Voltage", xlab=""))
with(powerSubset, plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(powerSubset$dateTime, powerSubset$Sub_metering_2, col="red")
lines(powerSubset$dateTime, powerSubset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black", "red", "blue"), bty="n")
with(powerSubset, plot(dateTime, Global_reactive_power, type="l", xlab=""))


dev.off()