corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  setwd(sprintf("~/datascience/%s",directory))
  data<-c(numeric(0), numeric(0))
  for(i in 1:332){
    filename <-sprintf("%03d.csv",i)
    sourcedata <- read.csv(filename)
    good<-complete.cases(sourcedata)
    if (sum(good)>threshold)
      data<-rbind(data,sourcedata[good,2:3])
  }
  print(cor(x=data[,1],y=data[,2], use="everything",method="pearson"))
}