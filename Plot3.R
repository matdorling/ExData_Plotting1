# load cleaned data subset

powerSubset <- read.table(file="powerSubset.txt", header=TRUE, sep=",", stringsAsFactors = F)
powerSubset$Date <- as.Date(powerSubset$Date, "%Y-%m-%d")
powerSubset$dateTime <- strptime(powerSubset$dateTime, "%Y-%m-%d %H:%M:%S")

# write plot to png

png(file="plot3.png", width=480, height=480)
with(powerSubset, plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(powerSubset$dateTime, powerSubset$Sub_metering_2, col="red")
lines(powerSubset$dateTime, powerSubset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black", "red", "blue"))

dev.off()