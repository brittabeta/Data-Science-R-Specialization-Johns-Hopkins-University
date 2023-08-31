# Part III
# ranking hospitals by outcome in a state
# valid num rankings: "best", "worst", or integer
# returns the rank specified in addition to state and outcome specified
rankhospital <- function(state, outcome, num){
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
    x <- subset(ndata, State==state, select=c("Hospital", outcome))
    head(x)
    y <- x[order(x[, outcome], x[, "Hospital"], decreasing = F), ]
    y2 <- cbind(y, rank = 1:dim(y)[1])}
  if (is.numeric(num)) {
    out <- y2[num, 1]
  } else if (num == "best") {
    out <- y2[1, 1]
  } else if (num == "worst") {
    out <- y2[dim(na.omit(y2))[1], 1]
  } else {
    stop("Invalid rank")
  }
  return(out)
} 
