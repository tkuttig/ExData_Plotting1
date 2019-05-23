## Plot 2

# read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# keep only 01/02/2007 - 02/02/2007
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# adjust language settings for x-axis
# Sys.setlocale("LC_TIME", "English") 

# transform data
data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# plot
png("plot2.png", height = 480, width = 480)
plot(data$DateTime, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
