# plot2.R - Global Active Power with Date/Time

# Read data, select two days of 2007-2-1 and 2007-2-2 and convert dates/times 
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, 
                  sep = ";", col.names = colnames(read.table("household_power_consumption.txt",
                                                             nrow = 1, header = TRUE, sep=";")))
hpc$datetime <- paste(hpc$Date,hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S")
datetime <- as.POSIXct(hpc$datetime)

# Open png device
png("plot2.png", width=480, height=480)

# Plot global active power with Date/Time changes
plot(hpc$Global_active_power~datetime,type="l",xlab="", ylab="Global Active Power (kilowatts)")

# Close png device
dev.off()
