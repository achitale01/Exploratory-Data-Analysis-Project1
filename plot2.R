# plot2.R
# R code for line plot of Global Active Power by day

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
png( filename="plot2.png", height=480, width=480, bg="transparent")

# plot line graph
plot( plotdata$Datetime,
      plotdata$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)"
      )

# close device
dev.off()