#Read in the data from file:
#Text file needs to be in the same directory:
hpc <- read.csv("~/Coursera/Exploratory Data Analysis/Week 1/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#Subset the data:
hpc = hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

#Change class for "Global Active Power":
class(hpc$Global_active_power) = "numeric"

#Create the PNG graphic object:
png(file = 'plot1.png')

#Create the plot:
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

#Close the PNG file:
dev.off()