plot3<-function()
{
  #reading the text file data as character in RAM = tempdata
  tempdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  
  
  #subseting the data based on date 
  subdata<-tempdata[tempdata$Date=="1/2/2007" | tempdata$Date=="2/2/2007",]
  
  
  #combine the date time for continous data
  subdata$DT <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
  
  #creating a device
  png(file="plot3.png",width=480,height=480)
  
  #ploting the grpah
  plot(subdata$DT,subdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
 
    
  #draw the line for submetering 2 and 3
  lines(subdata$DT, subdata$Sub_metering_2, type="l", col="red")
  
  lines(subdata$DT, subdata$Sub_metering_3, type="l", col="blue")
    
  #Placing legend,puts the text inside legend, giving appropriate sysmbols,giving legend the colors
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
  
  
  
  dev.off()
    
}