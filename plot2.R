#Download data into working directory before executing script#
rawdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subset<-subset(rawdata, Date == '1/2/2007' | Date =='2/2/2007')
subset$Date<-as.Date(subset$Date,"%d/%m/%Y")
x<-paste(subset$Date,subset$Time)
subset$datetime<-strptime(x,"%Y-%m-%d %H:%M:%S")
png(filename="plot2.png",width=480,height=480)
plot(subset$datetime,subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()