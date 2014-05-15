corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        dataSet<-NULL
        countComplete<-0
        completeCases<-NULL
        allPollutantData<-NULL
        corVector<-vector(mode="numeric",length=0)
        
        # get list of files and the count of complete cases in each 
        dataSet<-complete(directory)
        dataSetRows<-nrow(dataSet)
        
        # build vector of running total of min complete cases
        for(i in 1:dataSetRows){
                completeCases<-c(completeCases,dataSet[i,2])
        }
        
        iFile<-0
        countComplete<-0
        for(iFile in 1:length(completeCases)){  
                if(completeCases[iFile]>threshold){
                myFileName<-paste(getwd(),"/",directory,"/",sprintf("%03d",iFile),".csv",sep="")
                pollutantData<-read.csv(myFileName,header=TRUE)
                corVector<-c(corVector,signif(cor(pollutantData[,2],pollutantData[,3],use="complete.obs"),4))
                }
        }
        corVector
}