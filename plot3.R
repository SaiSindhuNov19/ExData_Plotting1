

a <- read.csv("household_power_consumption.txt", sep = ";", header = T,na.strings = "?")
dateTime <- paste(a$Date, a$Time)
dattime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
head(dattime)
class(dattime)
data <- data.frame(dattime,a[,3:9] )
head(data)



feb2 <- subset(data,(data$dattime >= ("2007-02-01 00:00:00 IST")) & (data$dattime <= ("2007-02-02 23:59:00 IST")))
write.csv(feb2,"Feb2_condition.csv")

####1 assignment
new <- feb2[complete.cases(feb2), ]
#new[,2]<- as.numeric(as.character(new[,2]))
png("plot3.png",width=480,height=480,units="px",res=NA) 
plot(new$dattime, new$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "") 
lines(new$dattime,new$Sub_metering_2,col="red")
lines(new$dattime,new$Sub_metering_3,col="blue")


legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
                    lty = 1,col= c("black","red","blue"), xjust = 1, yjust = 1)
dev.off()
