pollutantmean <- function(directory,pollutant,id=1:332){
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        allPollutantData<-NULL
        
        #load the data into a dataframe
        for(i in id) {
                myFileName<-paste(getwd(),"/",directory,"/",sprintf("%03d",i),".csv",sep="")
                pollutantData<-read.csv(myFileName,header=TRUE)
                allPollutantData<-rbind(allPollutantData,pollutantData)
        }
        #get null values for each column in the dataframe.
        for(i in 2:dim(allPollutantData)[2]) {
                myColName<-colnames(allPollutantData)[i]
                assign(myColName,is.na(allPollutantData[[myColName]]))
        }
        allPollutantData
}
