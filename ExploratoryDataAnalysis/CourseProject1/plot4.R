# Prepare data
library(sqldf)
query_str <- "select * from file where Date='1/2/2007' or Date='2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt", sep=";", sql=query_str)

# Plot
png("plot4.png")
par(mfrow=c(2, 2))
len <- length(df$Global_active_power)
label_pos <- c(0, len/2, len)
label_text <- c("Thu", "Fri", "Sat")

plot(1:len, df$Global_active_power, xlab="", ylab="Global Active Power", xaxt="n", type="l")
axis(1, at=label_pos, labels=label_text)

plot(1:len, df$Voltage, xlab="datetime", ylab="Voltage", xaxt="n", type="l")
axis(1, at=label_pos, labels=label_text)

plot(1:len, df$Sub_metering_1, xlab="", ylab="Energy sub metering", xaxt="n", yaxt="n", type="l")
lines(1:len, df$Sub_metering_2, col="red")
lines(1:len, df$Sub_metering_3, col="blue")
axis(1, at=c(0, len/2, len), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30))
legend_texts <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=legend_texts, col=c("black", "red", "blue"), lty=c(1, 1, 1))

plot(1:len, df$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", xaxt="n", yaxt="n", type="l")
axis(2, at=c(0, 0.1, 0.2, 0.3, 0.4, 0.5))
axis(1, at=label_pos, labels=label_text)

dev.off()