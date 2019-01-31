complete <- function(directory, id = 1:332) {
    nobs <- rep(0, length(id))
    for(i in seq_along(id)) {
        csv_path = file.path(directory, paste(formatC(id[i], width = 3, flag = "0"), ".csv", sep = ""))
        data = read.csv(csv_path)
        nobs[i] <- sum(complete.cases(data))
    }
    data.frame(id = id, nobs = nobs)
}