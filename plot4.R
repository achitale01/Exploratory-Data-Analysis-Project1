# plot4.R
# R code for 4 line plots of
# Global Active Power by day
# Voltage by day
# Energy sub metering by day
# Global_reactive_power by day

# read data file
mydata <- read.table( "./data/household_power_consumption.txt",
                      header=TRUE, sep=";", 
                      na.string="?", 
                      colClasses= c(rep("character", 2), rep("numeric", 7)), 
                      check.names = TRUE)

# convert date and time strings to datetime
mydata$Datetime <- strptime( paste(mydata$Date, mydata$Time),
                             format="%d/%m/%Y %H:%M:%S")


# subset to only the two dates of interest
# 2007-02-01 and 2007-02-02
plotdata <- subset( mydata, as.Date(mydata$Datetime) >= "2007-02-01"
                    & as.Date(mydata$Datetime) <="2007-02-02")

# open png device
png( filename="plot4.png", height=480, width=480, bg="transparent")

# set par for 2x2 plot
par(mfrow=c(2,2))

# plot line graphs
with( plotdata, {
# Global Active Power by day
  plot( plotdata$Datetime,
        plotdata$Global_active_power,
        type="l",
        xlab="",
        ylab="Global Active Power"
  )

# Voltage by day
  plot( plotdata$Datetime,
        plotdata$Voltage,
        type="l",
        xlab="datetime",
        ylab="Voltage"
  )
  
# Energy sub metering by day
# sub_metering_1 in black
  plot( plotdata$Datetime,
        plotdata$Sub_metering_1,
        type="l",
        xlab="",
        ylab="Energy sub metering"
  )
  
# annotate sub_metering_2 in red
  lines( plotdata$Datetime,
         plotdata$Sub_metering_2,
         col="red",
         type="l",
         xlab="",
         ylab="Energy sub metering"
  )
  
# annotate sub_metering_3 in blue
  lines( plotdata$Datetime,
         plotdata$Sub_metering_3,
         col="blue",
         type="l",
         xlab="",
         ylab="Energy sub metering"
  )
  
# annotate legend top-right
  legend(x="topright",
         lty=c(1,1,1),
         bty="n",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black","red","blue"))
  
  
# Global_reactive_power by day
  plot( plotdata$Datetime,
        plotdata$Global_reactive_power,
        type="l",
        xlab="datetime",
        ylab="Global_rective_power"
  )
})

# close device
dev.off()