#' Tests SummaryStats function over multiple datasets
#' @description  Use this function to test SummaryStats over all files and to 
#' present current error messages
#' All files data files threshold files must be in data/production-data
#' directory, if not then test is run on data/sampleSurvey 
#'  
#' @import rstudioapi
#' 
#' @return new_results_WQ new_results_rN testnewUr
#' @export
#' 
#' @examples
#' SummaryStats(theData, biomarkerField = c("ferritin"),
#' aggregationField = c("regionName"),groupId = c("WRA"), thresholds)
#' INSERT : data(dataname) ???

# setwd to current file location

library(rstudioapi)
library(magrittr)
library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

#### 12-Jan-2022 Latest version #### 

aggregateGroup <- c("wealthQuintile", "regionName", "urbanity")

testAll <- function (aggregateGroup){
        # Function 1 :- load the files 
        file_path = rstudioapi::getActiveDocumentContext()$path 
        setwd(dirname(file_path))
        extension <<- paste0("-", aggregateGroup, "-theData.rda")
        files <- strsplit(list.files("../data/production-data/", extension), extension)
        files <- lapply(files, 
                        function(x) gsub(x = x, pattern = "S3-",replacement = ""))
        
         # Function 2 :- test the aggregate group 
        testaggregateGroup <- function (x){
                load(file=paste0("../data/production-data/S3-", x, 
                                 extension), envir=globalenv())
                load(file=paste0("../data/production-data/", x,
                                 "-thresholds.rda"), envir=globalenv())
                tryCatch({
                        source("../R/summaryStats.R")
                        result <- source(paste0("../data/production-data/S3-", x, 
                                                "-", aggregateGroup, "-source.txt"))
                        return(list(paste0(x, "-", aggregateGroup), TRUE, result[[1]]))
                }, error=function(cond)  {
                        message(cond) 
                        return(list(x, FALSE, toString(cond)))})
        }
                lapply(files, testaggregateGroup)

}

final_results <- lapply(aggregateGroup, testAll)


# to test (should equal different results)
final_results[[1]][[27]][[3]]$aggregatedStats
final_results[[3]][[27]][[3]]$aggregatedStats



#####################
#### old version ####
all_aggregateGroups <- c("wealthQuintile", "regionName", "urbanity")
aggregateGroup <- c("wealthQuintile")


testAll <- function (x){

filesList <- function(aggregateGroup){
file_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(file_path))
extension <<- paste0("-", aggregateGroup, "-theData.rda")
files_list <- strsplit(list.files("../data/production-data/", extension), extension)
files_list <- lapply(files_list, 
                function(x) gsub(x = x, pattern = "S3-",replacement = ""))
return(files_list)
}
files <- filesList(aggregateGroup)

testaggregateGroup <- function (x){
        load(file=paste0("../data/production-data/S3-", x, 
                         extension), envir=globalenv())
        load(file=paste0("../data/production-data/", x,
                         "-thresholds.rda"), envir=globalenv())
        tryCatch({
                source("../R/summaryStats.R")
                result <- source(paste0("../data/production-data/S3-", x, 
                                           "-", aggregateGroup, "-source.txt"))
                return(list(paste0(x, "-", aggregateGroup), TRUE, result[[1]]))
        }, error=function(cond)  {
                message(cond) 
                return(list(x, FALSE, toString(cond)))})
}

all_results <- lapply(files, testaggregateGroup)

return (all_results)

}

final_results <- lapply(all_aggregateGroups, testAll)




# Find errors 
# To improve this function str-split by component number 
errorFind <- function (results_list){
        succeeded <- sapply(results_list, "[[", 2)
        failed <- results_list[!succeeded]
        index <- seq(succeeded)[!succeeded]
        errors <- as.data.frame(cbind(index, filename= sapply(failed, "[[", 1), error =sapply(failed, "[[", 3)))
        return(errors)
}

# Find errors in all aggregate group tests
errorFind(new_results_WQ)
errorFind(new_results_rN)
errorFind(new_results_Ur)


tofixErrors <- function(compareErrors){
        to_fix <- compare_errors[,c("filename", "index", "error.new")]
        to_fix <- subset(to_fix, !is.na(error.new ))
        return(to_fix)
}

to_fix <- rbind(c("wealthQunitile",errorFind(new_results_WQ)),
                c("regionName",errorFind(new_results_rN)),
                c("urbanity", errorFind(new_results_Ur)))

# unique_errors <- as.data.frame(table(compare_errors["error.new"]))


