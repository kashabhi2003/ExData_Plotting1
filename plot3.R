# Read data
data<- read.table("household_power_consumption.txt", sep = ";")
head(data)

# To give a guidance on the 'data' table
#   V1       V2                  V3                    V4            V5	      V6               V7              V8               V9
# 1 Date    Time       Global_active_power   Global_reactive_power  Voltage Global_intensity  Sub_metering_1  Sub_metering_2  Sub_metering_3

# Subset data as per dates
mydata <- data[data$V1 %in% c("1/2/2007","2/2/2007"),]
# Transform Active power data to numeric
numactpow <- as.numeric(mydata$V3)
# Merge and format Date/Time data
daystr <- strptime(paste(mydata$V1, mydata$V2, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Transform SubMetering data to numeric
subm1 <- as.numeric(as.character(mydata$V7))
subm2 <- as.numeric(as.character(mydata$V8))
subm3 <- as.numeric(as.character(mydata$V9))

# Open png() device, set size
png("plot3.png", width=480, height=480)
# Plot a basic line graph. Add colored lines
plot(daystr, subm1, type="l", ylab="Energy Sub metering", xlab="")
lines(daystr, subm2, type="l", col="red")
lines(daystr, subm3, type="l", col="blue")
# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()   # Close device
