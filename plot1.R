# plot1.R - Histogram of Global Active Power

# Read data, and select two days of 2007-2-1 and 2007-2-2
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, 
                  sep = ";", col.names = colnames(read.table("household_power_consumption.txt",
                                                             nrow = 1, header = TRUE, sep=";")))

# Open png device
png("plot1.png", width=480, height=480)

# Plot histogram
hist(hpc$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Close PNG file
dev.off()
