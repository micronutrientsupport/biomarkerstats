#' Development tool - Tests SummaryStats function over multiple datasets
#'
#' @description  Use this function to test SummaryStats over all files and to
#' present current error messages
#' All files data files threshold files must be in given directory
#' @importFrom magrittr %>%
#' @import srvyr jtools survey dplyr BRINDA
#' @return final_results
#'
#' @export
#' @examples

library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

# Set directory to a location where data files to test lie
# This script will work if they are placed in a subdirectory
# Set directory to a location where data files to test lie

setwd("./inst/production-data/")

aggregateGroup <- c("wealthQuintile", "regionName", "urbanity")

testAll <- function(aggregateGroup){
        extension <- paste0("-", aggregateGroup, "-theData.rda")
        files <- strsplit(list.files (".", extension), extension)
        files <- lapply(files,
                        function(x) gsub(x=x, pattern="S3-",replacement=""))
        testaggregateGroup <- function(x){
                load(file=paste0("S3-", x,
                                 extension), envir=globalenv())
                load(file=paste0(x, "-thresholds.rda"), envir=globalenv())
                tryCatch({
                        source("../../R/summaryStats.R")
                        result <- source(paste0("S3-", x, "-",
                                                aggregateGroup, "-source.txt"))
                        return(list(paste0(x, "-", aggregateGroup), TRUE, result[[1]]))
                }, error=function(cond)  {
                        message(cond)
                        return(list(x, FALSE, toString(cond)))})
        }
        lapply(files, testaggregateGroup)
}

final_results <- lapply(aggregateGroup, testAll)


# Find errors
# To improve this function str-split by component number
errorFind <- function (results_list){
        succeeded <- sapply(results_list, "[[", 2)
        failed <- results_list[!succeeded]
        index <- seq(succeeded)[!succeeded]
        errors <- as.data.frame(cbind(index, filename= sapply(failed, "[[", 1),
                                      error =sapply(failed, "[[", 3)))
        return(errors)
}

# Find errors in all aggregate group tests
errors <- errorFind(final_results[[1]])


#### Test one aggregate group

aggregateGroup <- c("wealthQuintile")

test_original <- function (x){
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/", x,"-theData.rda"),envir=globalenv())

        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats//inst/production-data/", x,"-thresholds.rda"), envir=globalenv())

        tryCatch(
                {
                        source("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/R/summaryStats.R")

                        wQ <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/",x,"-source.txt"))

                        rG <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/",x,"-region-source.txt"))

                        return(list(x,TRUE,wQ[[1]],rG[[1]]))
                },
                error=function(cond)  {
                        message(cond)
                        return(list(x,FALSE,toString(cond)))}
        )
}

setwd("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/")
files <- strsplit(list.files(, "-thresholds.rda"), "-thresholds.rda")
original_results <- lapply(files, test_original)

errorFind <- function (results_list){
        succeeded <- sapply(results_list, "[[", 2)
        failed <- results_list[!succeeded]
        index <- seq(succeeded)[!succeeded]
        errors <- as.data.frame(cbind(index, filename= sapply(failed, "[[", 1), error =sapply(failed, "[[", 3)))
        return(errors)
}

errors <- errorFind(original_results)


























# Comparision of function before/after changes

# tofixErrors <- function(compareErrors){
#         to_fix <- compare_errors[,c("filename", "index", "error.new")]
#         to_fix <- subset(to_fix, !is.na(error.new ))
#         return(to_fix)
# }

# to_fix <- rbind(c("wealthQunitile",errorFind(new_results_WQ)),
#                 c("regionName",errorFind(new_results_rN)),
#                 c("urbanity", errorFind(new_results_Ur)))
#
# # unique_errors <- as.data.frame(table(compare_errors["error.new"]))





