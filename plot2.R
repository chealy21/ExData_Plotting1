#read in data for February 1, 2007 to February 2, 2007
dat<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)

#name columns
names(dat)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#convert data and time to appropriate format
dat2<-transform(dat,DateTime=paste(dat$Date,dat$Time))
dat2$DateTime<-strptime(dat2$DateTime,"%d/%m/%Y %H:%M:%S")

#create png file
png("plot2.png")

#plot data
with(dat2,plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowats)",type="l"))

#close device
dev.off()