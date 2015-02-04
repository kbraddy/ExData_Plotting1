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


##Create plot1.png
png(filename = "plot1.png", width = 480, height = 480)
par(mar=c(4,4,2,1))
hist(data_sub$Global_active_power,col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
