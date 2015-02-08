plot4<-function()
{
  #reading the text file data as character in RAM = tempdata
  tempdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  
  
  #subseting the data based on date 
  subdata<-tempdata[tempdata$Date=="1/2/2007" | tempdata$Date=="2/2/2007",]
  
  
  #combine the date time for continous data
  subdata$DT <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
  
  png("plot4.png", width=480,height=480)
  
  par(mfrow=c(2,2))
  
  #plot the first (1,1) graph
  plot(subdata$DT,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #plot the (1,2)
  plot(subdata$DT,subdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  
  #plot the  (2,1) graph
  plot(subdata$DT,subdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
  lines(subdata$DT, subdata$Sub_metering_2, type="l", col="red")#draw the line for submetering 2 and 3
  lines(subdata$DT, subdata$Sub_metering_3, type="l", col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue")) #Placing legend
  
  
  #plot the (2,2) graph
  plot(subdata$DT,subdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  
  dev.off()
  
}