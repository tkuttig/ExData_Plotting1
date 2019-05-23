## Plot 1

# read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#data$Date <- strptime(data$Date, "%d/%m/%y")

# keep only 01/02/2007 - 02/02/2007
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# transform data
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
