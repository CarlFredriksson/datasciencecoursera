# Prepare data
library(sqldf)
query_str <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt", sep=";", sql=query_str)

# Plot
png("plot1.png")
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
