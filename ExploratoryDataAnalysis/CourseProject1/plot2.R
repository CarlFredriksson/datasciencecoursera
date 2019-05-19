# Prepare data
library(sqldf)
query_str <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt", sep=";", sql=query_str)

# Plot
png("plot2.png")
len <- length(df$Global_active_power)
plot(1:len, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", type="l")
axis(1, at=c(0, len/2, len), labels=c("Thu", "Fri", "Sat"))
dev.off()