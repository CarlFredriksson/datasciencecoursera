rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_data[, 11] <- as.numeric(outcome_data[, 11])
    outcome_data[, 17] <- as.numeric(outcome_data[, 17])
    outcome_data[, 23] <- as.numeric(outcome_data[, 23])
    
    ## Check outcome is valid
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(outcome == valid_outcomes[1] | outcome == valid_outcomes[2] | outcome == valid_outcomes[3])) {
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    col_index <- -1
    if (outcome == valid_outcomes[1]) {
        col_index <- 11
    } else if (outcome == valid_outcomes[2]) {
        col_index <- 17
    } else if (outcome == valid_outcomes[3]) {
        col_index <- 23
    }
    valid_states <- sort(unique(outcome_data[["State"]]))
    hospital_names <- rep(NA, length(valid_states))
    for (i in seq_along(valid_states)) {
        state <- valid_states[i]
        state_hospitals <- outcome_data[outcome_data[["State"]] == state,]
        if (num == "best") {
            hospital_name <- state_hospitals[which.min(state_hospitals[, col_index]), "Hospital.Name"]
        } else if (num == "worst") {
            hospital_name <- state_hospitals[which.max(state_hospitals[, col_index]), "Hospital.Name"]
        } else {
            order <- order(state_hospitals[, col_index], state_hospitals[, "Hospital.Name"])
            hospital_name <- state_hospitals[order, "Hospital.Name"][num]
        }
        hospital_names[i] <- hospital_name
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data_frame <- data.frame(hospital_names,valid_states, row.names = valid_states)
    colnames(data_frame) <- c("hospital", "state")
    data_frame
}
