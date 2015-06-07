PowerConsump <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
PowerConsump["date_time"] = paste(PowerConsump$Date,PowerConsump$Time,sep=" ")
PowerConsump["Date"] <- as.Date(PowerConsump$Date,"%d/%m/%Y")
dataToUse <- PowerConsump[(PowerConsump$Date >= "2007-02-01" & PowerConsump$Date <= "2007-02-02"), ]
SubMeterDS <- dataToUse[dataToUse$Sub_metering_3 != "?" & dataToUse$Sub_metering_2 != "?" & dataToUse$Sub_metering_1 != "?" & dataToUse$Time != "?",]
SubMeterDS$date_time <- strptime(SubMeterDS$date_time, format = "%d/%m/%Y %H:%M:%S")
SubMeterDS$Sub_metering_1 <- as.numeric(SubMeterDS$Sub_metering_1)
SubMeterDS$Sub_metering_2 <- as.numeric(SubMeterDS$Sub_metering_2)
SubMeterDS$Sub_metering_3 <- as.numeric(SubMeterDS$Sub_metering_3)
png("plot3.png")
plot(SubMeterDS$date_time,SubMeterDS$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="") 
lines(GlobalAcPowerDS$date_time,SubMeterDS$Sub_metering_1)
lines(GlobalAcPowerDS$date_time,SubMeterDS$Sub_metering_2,col="red") 
lines(GlobalAcPowerDS$date_time,SubMeterDS$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1) , 
       col = c("black","red","blue"), 
       legend = c("Sub metering 1","Sub Metering 2","Sub metering 3"))
dev.off()