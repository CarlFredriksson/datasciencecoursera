# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute emissions for motor vehicles in Baltimore
motor_SCC <- subset(SCC, grepl("Vehicles", EI.Sector, fixed=TRUE))
motor_vehicles_SCC <- subset(motor_SCC, grepl("Gasoline", EI.Sector, fixed=TRUE))
motor <- subset(NEI, SCC %in% motor_vehicles_SCC$SCC)
baltimore <- subset(motor, fips=="24510")
year_emissions <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), FUN=sum)

# Plot
png("plot5.png")
plot(year_emissions$year, year_emissions$x, pch=19, xlab="Year", ylab="Emissions", xaxt="n")
lines(year_emissions$year, year_emissions$x)
axis(1, at=c(year_emissions$year))
title(main="Baltimore Motor Vehicles")
dev.off()