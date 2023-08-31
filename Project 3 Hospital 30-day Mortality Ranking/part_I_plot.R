# Part I
# Plot the 30-day mortality rates for heart attack
# read the outcome data into R via the read.csv function 
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# and look at the first few rows
head(outcome)
# number of columns
ncol(outcome)
# number of rows
nrow(outcome)
# names of each column (variable)
names(outcome)
# make a simple histogram of the 30-day death rates from heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
