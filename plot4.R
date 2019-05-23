## Plot 4

# read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# keep only 01/02/2007 - 02/02/2007
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# adjust language settings for x-axis
# Sys.setlocale("LC_TIME", "English") 

# transform data
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

# plot
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
# top left
plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power")

# top right
plot(data$DateTime, data$Voltage, 
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage")

# bottom left
plot(data$DateTime, data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering",
     col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 2, 
       col = c("black", "red", "blue"),
       bty = "n")

# bottom right
plot(data$DateTime, data$Global_reactive_power, 
     type = "l",
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()

