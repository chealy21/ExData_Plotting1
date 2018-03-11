#read in data for February 1, 2007 to February 2, 2007
dat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)

#name columns
names(dat)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#convert data and time to appropriate format
dat2<-transform(dat,DateTime=paste(dat$Date,dat$Time))
dat2$DateTime<-strptime(dat2$DateTime,"%d/%m/%Y %H:%M:%S")

#create png file
png("plot4.png")

#partition window
par(mfrow=c(2,2))

#add plots
#top left
with(dat2,plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowats)",type="l"))

#top right
with(dat2,plot(DateTime,Voltage,xlab="datetime",ylab="Voltage",type="l"))

#bottom left
with(dat2,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
lines(dat2$DateTime,dat2$Sub_metering_2,col="red")
lines(dat2$DateTime,dat2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=1,bty="n")

#bottom right
with(dat2,plot(DateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"))

#close device
dev.off()