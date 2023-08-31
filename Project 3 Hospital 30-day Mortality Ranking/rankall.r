# Part IV
# return a data frame of all hospitals (all states) based on specified ranking and outcome
# valid num rankings: "best", "worst", or integer
# valid outcome: "heart attack", "heart failure", "pneumonia" 30-day mortality

# utilize rankhospital function
source("rankhospital.R")

rankall <- function(outcome, num = "best"){
  # read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  # define unique states in the data
  s <- (unique(data[,7]))
  s2 <- s[order(s)]
  # initialize data frame
  ra <- data.frame()
  # loop through states and obtain specified ranked hospital for each state
  for (i in 1:length(s)) {
    r <- rankhospital(state = s2[i], outcome, num)
    ra <- c(ra, r)
    out <- cbind(ra, s2)
    out <- as.data.frame(out)
    rownames(out) <- s2
    colnames(out) <- c("hospital", "state")
  }
  return(out)
}