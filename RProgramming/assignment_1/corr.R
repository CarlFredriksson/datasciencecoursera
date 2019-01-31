corr <- function(directory, threshold = 0) {
    cr <- numeric()
    comp <- complete(directory)
    for(i in 1:nrow(comp)) {
        if (comp[i, "nobs"] > threshold) {
            csv_path = file.path(directory, paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
            data = read.csv(csv_path)
            complete_data = data[complete.cases(data),]
            sulfate <- complete_data[["sulfate"]]
            nitrate <- complete_data[["nitrate"]]
            cr <- c(cr, cor(sulfate, nitrate))
        }
    }
    cr
}