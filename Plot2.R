# Code to load cleaned data
powerSubset <- read.table(file="powerSubset.txt", header=TRUE, sep=",", stringsAsFactors = F)
powerSubset$Date <- as.Date(powerSubset$Date, "%Y-%m-%d")
powerSubset$dateTime <- strptime(powerSubset$dateTime, "%Y-%m-%d %H:%M:%S")

# Code to generate and output plot
png(file="plot2.png", width=480, height=480)
with(powerSubset, plot(dateTime, Global_active_power, type="l", main="Global Active Power", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()