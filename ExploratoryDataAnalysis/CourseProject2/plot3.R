library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute emissions per year and type for Baltimore
baltimore <- subset(NEI, fips=="24510")
year_emissions <- aggregate(baltimore$Emissions, by=list(year=baltimore$year, type=baltimore$type), FUN=sum)

# Plot
png("plot3.png")
qplot(year, x, data=year_emissions, col=type, geom=c("point", "line"), xlab="Year", ylab="Emissions", main="Baltimore") +
    scale_x_continuous(breaks=year_emissions$year)
dev.off()
