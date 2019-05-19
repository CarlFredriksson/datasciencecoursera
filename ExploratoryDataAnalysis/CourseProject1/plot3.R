# Prepare data
library(sqldf)
query_str <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt", sep=";", sql=query_str)

# Plot
png("plot3.png")
len <- length(df$Sub_metering_1)
plot(1:len, df$Sub_metering_1, xlab="", ylab="Energy sub metering", xaxt="n", yaxt="n", type="l")
lines(1:len, df$Sub_metering_2, col="red")
lines(1:len, df$Sub_metering_3, col="blue")
axis(1, at=c(0, len/2, len), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30))
legend_texts <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=legend_texts, col=c("black", "red", "blue"), lty=c(1, 1, 1))
dev.off()