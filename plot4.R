## read the data
data <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep =";",na.strings = "?")

## convert dates and times
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data[, 1] <- as.Date(data$Date, format = "%d/%m/%Y")

## getting the subset
data <- data[format(data$Date, "%Y-%m-%d") == "2007-02-01" | format(data$Date, "%Y-%m-%d") == "2007-02-02" ,]

## plotting plot4.png
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(data$Time, data$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power")

plot(data$Time, data$Voltage, type = "l", xlab= "datetime", ylab = "Voltage")

plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd =1)

plot(data$Time, data$Global_reactive_power, type = "l", xlab= "datetime", ylab = "Global_reactive_power")
dev.off()