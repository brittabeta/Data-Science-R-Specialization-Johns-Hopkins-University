pollutantmean <- function(directory, pollutant, id = 1:332){
  # 'directory' a character vector of length 1
  # location of the csv files
  directory <- paste(getwd(),"/",directory,"/",sep="")
  files <- list.files(directory)
  data <- NA
  # 'pollutant' a character vector of length 1
  # name of the pollutant to calculate mean from
  # either 'sulfate' or 'nitrate'
  # 'id' an integer vector 
  # monitor id numbers to be used
  for (i in id) {
    #Read the file,
    file_dir <- paste(directory,files[i],sep="")
    file_data <- read.csv(file_dir)
    data <- rbind(data,file_data)
  }
  # return: mean of pollutant across select monitors
  # in the id vector (ignoring NA values)
  mean(data[[pollutant]], na.rm = TRUE)
}