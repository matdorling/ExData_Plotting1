powerSubset <- read.table(file="powerSubset.txt", header=TRUE, sep=",", stringsAsFactors = F)
powerSubset$Date <- as.Date(powerSubset$Date, "%Y-%m-%d")
powerSubset$dateTime <- strptime(powerSubset$dateTime, "%Y-%m-%d %H:%M:%S")

png(file="plot1.png", width=480, height=480)
with(powerSubset, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()