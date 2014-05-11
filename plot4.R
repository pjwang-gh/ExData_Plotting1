# plot4.R - Multiplot time series of global active power, voltage, submetering 
# and global reactive power

# Read data, select two days of 2007-2-1 and 2007-2-2 and convert dates/times 
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, 
                  sep = ";", col.names = colnames(read.table("household_power_consumption.txt",
                                                             nrow = 1, header = TRUE, sep=";")))
hpc$datetime <- paste(hpc$Date,hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S")
datetime <- as.POSIXct(hpc$datetime)

# Open png device
png("plot4.png", width=480, height=480)

# Configure multi plots
par(mfcol=c(2,2))

# Global active power plot
plot(hpc$Global_active_power~datetime,type="l",xlab="", ylab="Global Active Power (kilowatts)")

# Sub metering plot
plot(hpc$Sub_metering_1~datetime, type="l",xlab="", ylab="Energy sub metering")
lines(datetime, hpc$Sub_metering_2,col="red")
lines(datetime,hpc$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), bty="n")

# Voltage plot
plot(hpc$Voltage~datetime, type="l",ylab="Voltage")

# Global reactive power plot
plot(hpc$Global_reactive_power~datetime, type="l",ylab="Global_reactive_power")

# Close png device
dev.off()
