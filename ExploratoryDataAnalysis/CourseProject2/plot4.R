# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute emissions for coal-combustion related sources
coal_SCC <- subset(SCC, grepl("coal", Short.Name, fixed=TRUE))
coal <- subset(NEI, SCC %in% coal_SCC$SCC)
year_emissions <- aggregate(coal$Emissions, by=list(year=coal$year), FUN=sum)

# Plot
png("plot4.png")
plot(year_emissions$year, year_emissions$x, pch=19, xlab="Year", ylab="Emissions", xaxt="n")
lines(year_emissions$year, year_emissions$x)
axis(1, at=c(year_emissions$year))
title(main="Coal-combustion related")
dev.off()