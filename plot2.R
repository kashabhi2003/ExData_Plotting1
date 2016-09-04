# Read data
data<- read.table("household_power_consumption.txt", sep = ";")
dim(data)
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

# Open png() device, set size
png("plot2.png", width=480, height=480)
plot(daystr, numactpow, type="l",xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()   # Close device