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

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")  # why must write png() first ?
hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
dev.off()
