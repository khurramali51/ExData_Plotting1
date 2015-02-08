plot2<-function()
{
  #reading the text file data as character in RAM = tempdata
  tempdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  
  
  #subseting the data based on date 
  subdata<-tempdata[tempdata$Date=="1/2/2007" | tempdata$Date=="2/2/2007",]
  
  
  #combine the date time for continous data
  subdata$DT <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
  
  #creating a device
  png(file="plot2.png",width=480,height=480)
  
  #draw the plot
  plot(subdata$DT,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
  
}
