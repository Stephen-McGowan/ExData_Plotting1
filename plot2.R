#Loading Packages, Obtaining Data, and Loading Data

dev.off
TWD <- "EDA Wk1 Peer Reviewed"
if(!dir.exists(TWD)){
  dir.create(TWD)}
setwd(TWD)
DLas <- "exploratory_data_analysis_w1PR.zip"
DLfrom <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
FileName <- "household_power_consumption.txt"
if(!file.exists(DLas)){
  download.file(DLfrom, DLas, mode="wb")}
if(!file.exists(FileName)){
  unzip(DLas,files=NULL,exdir=".")}
HPC<-read.csv(FileName,header=TRUE,sep=";",na.strings="?")


HPC$Date<-as.Date(HPC$Date,"%d/%m/%Y")
HPC<-HPC[HPC$Date=="2007-02-01"|HPC$Date=="2007-02-02",]
HPC$DateTime<-as.POSIXct(strptime(paste(HPC$Date, HPC$Time, sep =" "),format="%Y-%m-%d %H:%M:%S"))
HPC$Global_active_power<-as.numeric(as.character(HPC$Global_active_power))

plot(HPC$DateTime,HPC$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()

rm(list=ls())
setwd("..")