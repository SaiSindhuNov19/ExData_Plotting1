
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
new[,2]<- as.numeric(as.character(new[,2]))

png("plot1.png",width=480,height=480,units="px",res=NA) 
hist(new$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global_active_power (Kilowatts)", ylab = "Frequency")
dev.off()


