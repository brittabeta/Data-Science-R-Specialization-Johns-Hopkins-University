corr <- function(directory, threshold = 0){
  # 'directory a character vector of length 1
  # location of the csv files
  directory <- paste(getwd(),"/",directory,"/",sep="")
  files <- list.files(directory)
  # 'threshold' a numeric vector
  # number of completely observed observations
  # (on all variables) required to compute the
  # correlation between nitrate and sulfate
  # default 0
  observations <- complete(directory)
  filtered_observations = subset(observations,observations$nobs > threshold)
  # return a numeric vector of correlations
  correlation <- vector()
  for (i in filtered_observations$id) {
    file_dir <- paste(directory,files[i],sep="")
    file_data <- read.csv(file_dir)
    file_data <- subset(file_data,complete.cases(file_data))        
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate))    
  }
  correlation
}