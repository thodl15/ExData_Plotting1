#Read in the data from file:
#Text file needs to be in the same directory:
hpc <- read.csv("~/Coursera/Exploratory Data Analysis/Week 1/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#Subset the data:
hpc = hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

#Convert Date and Time into a single attribute, DateTime:
dates = hpc$Date
times = hpc$Time
dateTime = paste(dates, times)
hpc$DateTime = strptime(dateTime, "%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

#Change class for "Global Active Power":
class(hpc$Global_active_power) = "numeric"

#Create the PNG graphic object:
png(file = 'plot3.png')

#Create the plot:
plot(hpc$DateTime, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Close the PNG file:
dev.off()