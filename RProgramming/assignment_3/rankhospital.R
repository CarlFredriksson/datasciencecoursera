rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_data[, 11] <- as.numeric(outcome_data[, 11])
    outcome_data[, 17] <- as.numeric(outcome_data[, 17])
    outcome_data[, 23] <- as.numeric(outcome_data[, 23])
    
    ## Check that state and outcome are valid
    valid_states <- unique(outcome_data[["State"]])
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(state %in% valid_states)) {
        stop("invalid state")
    } else if (!(outcome == valid_outcomes[1] | outcome == valid_outcomes[2] | outcome == valid_outcomes[3])) {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with the given rank 30-day death rate
    state_hospitals <- outcome_data[outcome_data[["State"]] == state,]
    col_index <- -1
    if (outcome == valid_outcomes[1]) {
        col_index <- 11
    } else if (outcome == valid_outcomes[2]) {
        col_index <- 17
    } else if (outcome == valid_outcomes[3]) {
        col_index <- 23
    }
    hospital_name <- NA
    if (num == "best") {
        hospital_name <- state_hospitals[which.min(state_hospitals[, col_index]), "Hospital.Name"]
    } else if (num == "worst") {
        hospital_name <- state_hospitals[which.max(state_hospitals[, col_index]), "Hospital.Name"]
    } else {
        order <- order(state_hospitals[, col_index], state_hospitals[, "Hospital.Name"])
        hospital_name <- state_hospitals[order, "Hospital.Name"][num]
    }
    hospital_name
    
}