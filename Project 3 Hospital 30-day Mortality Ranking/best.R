# Part II
# Finding the best hospital in a state
best <- function(state, outcome){
  # read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  # cast outcome columns to numeric
  data[,11] <- as.numeric(data[,11]) # 30-day Heart Attack Mortality
  data[,17] <- as.numeric(data[,17]) # 30-day Heart Failure Mortality
  data[,23] <- as.numeric(data[,23]) # 30-day Pneumonia Mortality
  # select the subset of columns needed: additional 2 and 7 for hospital and state
  ndata <- data[,c(2,7,11,17,23)]
  head(ndata)
  # change the names of subset columns
  names(ndata) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")
  # check that state and outcome are valid
  if(!state %in% ndata[, "State"]){
    stop("Invalid State")
  } else if(!outcome %in% colnames(ndata[,3:5])){
    stop("Invalid outcome")
  } else {
    a <- subset(ndata, State==state)
    min <- min(a[,outcome], na.rm=T)
    x <- r <- a[which(a[,outcome]==min),]
    y <- r[order(r$Hospital), 1]
  } 
  return(y)
}