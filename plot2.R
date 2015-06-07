PowerConsump <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
PowerConsump["date_time"] = paste(PowerConsump$Date,PowerConsump$Time,sep=" ")
PowerConsump["Date"] <- as.Date(PowerConsump$Date,"%d/%m/%Y")
dataToUse <- PowerConsump[(PowerConsump$Date >= "2007-02-01" & PowerConsump$Date <= "2007-02-02"), ]
GlobalAcPowerDS <- dataToUse[dataToUse$Global_active_power != "?" & dataToUse$Time != "?",]
GlobalAcPowerDS$date_time <- strptime(GlobalAcPowerDS$date_time, format = "%d/%m/%Y %H:%M:%S")
GlobalAcPowerDS$Global_active_power <- as.numeric(GlobalAcPowerDS$Global_active_power)
png("plot2.png")
plot(GlobalAcPowerDS$date_time,GlobalAcPowerDS$Global_active_power, type="n",ylab="Global Active Power (Kilowatts)",xlab="") 
lines(GlobalAcPowerDS$date_time,GlobalAcPowerDS$Global_active_power) 

