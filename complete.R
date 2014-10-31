complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  setwd(sprintf("~/datascience/%s",directory))
  data<-data.frame(numeric(0), numeric(0))
  for(i in id){
      filename <-sprintf("%03d.csv",i)
      sourcedata <- read.csv(filename)
      x<-sum(complete.cases(sourcedata))
      data<-rbind(data,c(i,x))
  }
  colnames(data)<-c("id", "nobs")
  print(data)
}