#Download data into working directory before executing script#
rawdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subset<-subset(rawdata, Date == '1/2/2007' | Date =='2/2/2007')
subset$Date<-as.Date(subset$Date,"%d/%m/%Y")
x<-paste(subset$Date,subset$Time)
subset$datetime<-strptime(x,"%Y-%m-%d %H:%M:%S")
hist(subset$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,"plot1.png")
dev.off()