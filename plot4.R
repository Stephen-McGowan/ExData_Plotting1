#Loading Packages, Obtaining Data, and Loading Data

dev.off()
TWD <- "EDA Wk1 Peer Reviewed"
if(!dir.exists(TWD)){dir.create(TWD)}
setwd(TWD)
DLas <- "exploratory_data_analysis_w1PR.zip"
DLfrom <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
FileName <- "household_power_consumption.txt"
if(!file.exists(DLas)){download.file(DLfrom, DLas, mode="wb")}
if(!file.exists(FileName)){unzip(DLas,files=NULL,exdir=".")}
HPC<-read.csv(FileName,header=TRUE,sep=";",na.strings="?")

HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC<-HPC[HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02",]
HPC$DateTime<-strptime(paste(HPC$Date, HPC$Time, sep =" "),format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(HPC,{
  plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  plot(DateTime,Voltage,type="l",ylab="Voltage(volts)",xlab="")
  plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1)
  plot(DateTime,Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power(kilowatts)")
})
dev.copy(png,file="plot4.png", height=480, width=480, units="px")
dev.off()
rm(list=ls())
setwd("..")