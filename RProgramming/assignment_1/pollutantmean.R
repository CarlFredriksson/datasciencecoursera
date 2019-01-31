pollutantmean <- function(directory, pollutant, id = 1:332) {
    num_values <- 0
    sum_values <- 0
    for(i in id) {
        csv_path = file.path(directory, paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
        data = read.csv(csv_path)
        pollutant_data = data[pollutant]
        non_na = pollutant_data[!is.na(pollutant_data)]
        num_values <- num_values + length(non_na)
        sum_values <- sum_values + sum(non_na)
    }
    sum_values / num_values
}