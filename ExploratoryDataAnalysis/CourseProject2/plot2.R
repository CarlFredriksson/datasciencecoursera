# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute total emissions per year for Baltimore
baltimore <- subset(NEI, fips=="24510")
year_emissions <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), FUN=sum)

# Plot
png("plot2.png")
plot(year_emissions$year, year_emissions$x, pch=19, xlab="Year", ylab="Total Emissions", xaxt="n")
lines(year_emissions$year, year_emissions$x)
axis(1, at=c(year_emissions$year))
title(main="Baltimore")
dev.off()
