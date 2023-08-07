# Data-Science-R-Specialization-Johns-Hopkins-University
* [Course Textbook](https://leanpub.com/rprogramming?utm_source=coursera&utm_medium=CourseraEmail&utm_campaign=Coursera) 
- [Also available here](https://www.lulu.com/shop/roger-peng/r-programming-for-data-science/paperback/product-22280814.html?page=1&pageSize=4) 

## swirl
* [swirl R package](https://swirlstats.com/)
* Statistics with Interactive R Learning = SWIRL
* developed by Nick Carchedi, Johns Hopkins Biostatistics
* includes: bitops, RCurl, and swirl
  
```R
# install swirl package
install.packages("swirl")

# check version of swirl 2.2.21 or later
packageVersion("swirl")

# install R Programming course
install_from_swirl("R Programming")

# load swirl
library(swirl)

# clean up
ls()
rm(list = ls())

# start swirl
swirl()
```

## Project 1 Air Pollution
* Introduction
This project entails writing three functions that are meant to interact with with the specdata dataset provided by the course. 
* Data
- specdata contains 332 comma-separated-value (CSV) files 
- pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. 
- ID: each file contains data from a single monitor and the ID number for each monitor is contained in the file name 
- date: the date of the observation in YYYY-MM-DD format (year-month-day)
- sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
- nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
- missing values: there are many days where either sulfate or nitrate (or both) are missing (coded as NA); this is common with air pollution monitoring data in the United States
* Part 1
- Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. 
* Part 2
- Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.
* Part 3
- Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
* Tests
- File containing a tests to ensure function outputs are as desired and expected
