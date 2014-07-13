plot4 <- function() {
  rawData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
  Timestamp <- as.POSIXct(strptime(paste(rawData$Date,rawData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S",tz="GMT"))
  rawData$Timestamps <- cbind(Timestamp)
  rawData$Timestamps <- as.POSIXct(rawData$Timestamps,tz="GMT",origin="1970-01-01 00:00.00 UTC")
  rawDataSample <- rawData[as.Date(rawData$Timestamps) >= as.Date("2007-02-01") & as.Date(rawData$Timestamps) <= as.Date("2007-02-02"),]
  plot.new()
  par(mfrow=c(2,2),cex=0.6)
  plot(rawDataSample$Timestamps,rawDataSample$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(x=rawDataSample$Timestamps,y=rawDataSample$Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(x=rawDataSample$Timestamps,y=rawDataSample$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(x=rawDataSample$Timestamps,y=rawDataSample$Sub_metering_2,col="red")
  lines(x=rawDataSample$Timestamps,y=rawDataSample$Sub_metering_3,col="blue")
  legend("topright",xjust=0,bty="n",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(rawDataSample$Timestamps,rawDataSample$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  dev.copy(png, file="Plot4.png",width=480,height=480) 
  dev.off()
}