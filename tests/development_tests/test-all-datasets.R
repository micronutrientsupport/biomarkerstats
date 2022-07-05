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

library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

# Set directory to a location where data files to test lie
# This script will work if they are placed in a sub-directory
setwd("./inst/production-data/")
setwd("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/")


# TODO 13/06/22
# MAKE CLEAR TO USERS THE PREFIX - FEED IN AS ARGUMENT FUNCTION? testaggregateGroup <- function(x) { ()

## TODO 14/06/22
# comparision of function before/after changes

## ERRORS EXPECTED:
# 1) 'region name' in Malawian dataset (10 tests)
# 2) 'iodine' in MEN & PSC Ethiopian data (2 tests per aggregate group = 6 tests)


#aggregateGroup <- c("wealthQuintile") # TEST CASE - REMOVE
aggregateGroup <- c("wealthQuintile", "regionName", "urbanity")


testAll <- function(aggregateGroup) {
  # identify the files for analysis
  extension <- paste0("-", aggregateGroup, "-theData.rda")
  files <- strsplit(list.files (".", extension), extension)

  # Function to loop over each file
  testaggregateGroup <- function(x) {
    # load in the data file
    load(file = paste0(x, extension), envir = globalenv())
    # load in the threshold file
    prefix <- "S2-|S3-"
    thres_prefix <- strsplit(x, prefix)[[1]][2]
    load(file = paste0(thres_prefix, "-thresholds.rda"),envir = globalenv())
    # Catch the errors when running the summaryStats script
    tryCatch({
      # load in the summaryStats function
      source("../../R/summaryStats.R")
      # call the function using the line in the source file and catch the result
      result <- source(paste0(x, "-",
                              aggregateGroup, "-source.txt"))
      return(list(paste0(x, "-", aggregateGroup), TRUE, result[[1]]))
    }, error = function(cond)  {
      message(cond)
      return(list(x, FALSE, toString(cond)))
    })
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
## CREATE LOOP/APPLY FOR EACH AGGREGATE GROUP (WQ/REG/URB)
errors_wealthQuintile <- errorFind(final_results[[1]])
errors_regionName <- errorFind(final_results[[2]])
errors_urbanity <- errorFind(final_results[[3]])


# tofixerrors <- function(compareerrors){
#        to_fix <- compare_errors[,c("filename", "index", "error.new")]
#        to_fix <- subset(to_fix, !is.na(error.new ))
#        return(to_fix)
# }
#
# to_fix <- rbind(c("wealthqunitile",errorfind(new_results_wq)),
#                 c("regionname",errorfind(new_results_rn)),
#                 c("urbanity", errorfind(new_results_ur)))
#
# unique_errors <- as.data.frame(table(compare_errors["error.new"]))
#




