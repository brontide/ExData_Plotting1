# Eric Warnke Project 1 Coursera: Exploritory Data Analytics

# Does the data exist?

if(!file.exists("household_power_consumption.txt")) {
  # Download dataset
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile = "household_power_consumption.zip", method = "curl")
  unzip("household_power_consumption.zip")
}

# Read in our table and do any basic manipulation

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date

dateFMT <- "%d/%m/%Y"
data$Date <- as.Date(data$Date, dateFMT)

dateTimeFMT <- "%Y-%m-%d %H:%M:%S"
data$DateTime <- strptime(paste(data$Date,data$Time), dateTimeFMT)

# Create sub-selection between these two dates

DATE1 <- as.Date('2007-02-01')
DATE2 <- as.Date('2007-02-02')

data.sub <- data[data$Date >= DATE1 & data$Date <= DATE2, ]

# Open png device

png(filename = "plot1.png")

# Create histogram of data

hist(data.sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Close png device

dev.off()
