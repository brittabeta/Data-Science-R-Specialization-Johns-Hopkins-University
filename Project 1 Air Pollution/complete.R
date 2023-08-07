complete <- function(directory, id = 1:332){
  # 'directory a character vector of length 1
  # location of the csv files
  directory <- paste(getwd(),"/","specdata","/",sep="")
  files <- list.files(directory)
  # 'id' an integer vector
  # monitor ID numbers to be used
  ids <- vector()
  nobs <- vector()
  # return a data frame of the form:
  ## columns: id nobs
  ## where 'id' is the monitor ID
  ## 'nobs' is number of complete cases
  for (i in id) {
    file_dir <- paste(directory,"/",files[i],sep="")
    file_data <- read.csv(file_dir)
    ids = c(ids,i)
    nobs = c(nobs,sum(complete.cases(file_data)))        
  }
  data.frame(id = ids, nobs = nobs)
}