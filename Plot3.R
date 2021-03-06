data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?")
dim(data)
str(data)

attach(data)
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]
head(newData)
attach(newData)
x <- paste(Date, Time)
head(x)

newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")  # add a new column to dataaframe
names(newData)
rownames(newData) <- 1:nrow(newData)
dim(newData)

attach(newData)



# Plot3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(DateTime, Sub_metering_1, type="l", colo="black", xlab="", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1)
dev.off()
