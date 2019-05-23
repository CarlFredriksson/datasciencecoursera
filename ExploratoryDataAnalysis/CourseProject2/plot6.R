library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute emissions for motor vehicles in Baltimore and Los Angeles
motor_SCC <- subset(SCC, grepl("Vehicles", EI.Sector, fixed=TRUE))
motor_vehicles_SCC <- subset(motor_SCC, grepl("Gasoline", EI.Sector, fixed=TRUE))
motor <- subset(NEI, SCC %in% motor_vehicles_SCC$SCC)
baltimore_la <- subset(motor, fips=="24510" | fips=="06037")
year_emissions <- aggregate(baltimore_la$Emissions, by=list(year=baltimore_la$year, fips=baltimore_la$fips), FUN=sum)

# Normalize emissions per city
baltimore_x <- year_emissions[year_emissions$fips=="24510","x"]
year_emissions[year_emissions$fips=="24510","x"] <- baltimore_x / max(baltimore_x)
la_x <- year_emissions[year_emissions$fips=="06037","x"]
year_emissions[year_emissions$fips=="06037","x"] <- la_x / max(la_x)

# Add area column
year_emissions$Area <- ifelse(year_emissions$fips=="24510", "Baltimore City", "LA County")

# Plot
png("plot6.png")
qplot(year, x, data=year_emissions, col=Area, geom=c("point", "line"), xlab="Year", ylab="Normalized Emissions",
    main="Baltimore City and LA County Motor Vechicles") +
    scale_x_continuous(breaks=year_emissions$year)
dev.off()
