#read in data for February 1, 2007 to February 2, 2007
dat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)

#name columns
names(dat)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#convert data and time to appropriate format
dat2<-transform(dat,DateTime=paste(dat$Date,dat$Time))
dat2$DateTime<-strptime(dat2$DateTime,"%d/%m/%Y %H:%M:%S")

#create png file
png("plot3.png")

#make plot
with(dat2,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
lines(dat2$DateTime,dat2$Sub_metering_2,col="red")
lines(dat2$DateTime,dat2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))

#close device
dev.off()