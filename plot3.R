##Load in data set
data <- fread("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
##Format date to use for subset
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
##Subset data for just 2/1 & 2/2 dates
data_sub <- data[(Date >= "2007-02-01" & Date <= "2007-02-02"),]
##Remove original dataset
rm(data)
##Change column to numeric
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
##Combine date & time column into new column
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

##Create plot3.png
png(filename = "plot3.png", width = 480, height = 480)
with(data_sub, {
  plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Datetime, Sub_metering_2, col = "Red")
  lines(Datetime, Sub_metering_3, col = "Blue")
})

legend("topright", col=c("black","red","blue"), lty = 1, lwd = 2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
