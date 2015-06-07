PowerConsump <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
PowerConsump["Date"] <- as.Date(PowerConsump$Date,"%d/%m/%Y")
#PowerConsump["Time"] <- strptime(PowerConsump$Time,"%H:%M:%S")
dataToUse <- PowerConsump[(PowerConsump$Date >= "2007-02-01" & PowerConsump$Date <= "2007-02-02"), ]
GlobalAcPowerDS <- dataToUse[dataToUse$Global_active_power != "?",]
GlobalAcPowerDS$Global_active_power <- as.numeric(GlobalAcPowerDS$Global_active_power)
png("plot1.png")
hist(GlobalAcPowerDS$Global_active_power*.001,col="darkblue",main="Global Active Power",xlab="Global Active Power(kilowatts)")
