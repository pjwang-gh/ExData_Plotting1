# plot3.R - Global Active Power change by sub metering with Date/Time 

# Read data, select two days of 2007-2-1 and 2007-2-2 and convert dates/times 
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, 
                  sep = ";", col.names = colnames(read.table("household_power_consumption.txt",
                                                             nrow = 1, header = TRUE, sep=";")))
hpc$datetime <- paste(hpc$Date,hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S")
datetime <- as.POSIXct(hpc$datetime)

# Open png device
png("plot3.png", width=480, height=480)

# Plot global active power change by sub metering with Date/Time
plot(hpc$Sub_metering_1~datetime, type="l",xlab="", ylab="Energy sub metering")
lines(datetime, hpc$Sub_metering_2,col="red")
lines(datetime,hpc$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

# Close png device
dev.off()
