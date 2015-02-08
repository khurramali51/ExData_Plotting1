plot1<-function()
{
  #reading the text file data as character in RAM = tempdata
  tempdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  
    
  #subseting the data based on date 
  subdata<-tempdata[tempdata$Date=="1/2/2007" | tempdata$Date=="2/2/2007",]
  
 
  #creating png device
  png(file="plot1.png",width=480,height=480)
  
  #ploting histogram
  hist(as.numeric(subdata$Global_active_power),col="red",xlab="Global_active_power (kilowatts)",main="Global Active Power")
  
  #closing the device
  dev.off()
  
}
