# Development tool - Tests SummaryStats function over multiple datasets

# 1) Change working directory to this (source) file's directory
  # (Session > Set Working Directory > To Source File Location)

# 2) Place data files in the same location as this script

# MAKE SURE TO HAVE MOST RECENT PACKAGE UPDATES: AUTOMATE

library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

aggregateGroup <- c("wealthQuintile", "regionName", "urbanity")
# aggregateGroup <- c("wealthQuintile")
testAll <- function(aggregateGroup, script, prefix) {
  # identify the files for analysis
  extension <- paste0("-", aggregateGroup, "-theData.rda")
  files <- strsplit(list.files (".", extension), extension)
  message(paste("Testing", aggregateGroup, "with script", script))
  # Function to loop over each file
  testaggregateGroup <- function(x) {
    # load in the data file
    load(file = paste0(x, extension), envir = globalenv())
    # load in the threshold file
    thres_prefix <- strsplit(x, prefix)[[1]][2]
    load(file = paste0(thres_prefix, "-thresholds.rda"),envir = globalenv())
    # Catch the errors when running the summaryStats script
    tryCatch({
      # load in the summaryStats function
      source(script)
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

# Find errors
errorFind <- function (results_list){
  succeeded <- sapply(results_list, "[[", 2)
  failed <- results_list[!succeeded]
  index <- seq(succeeded)[!succeeded]
  errors <- as.data.frame(cbind(index, filename= sapply(failed, "[[", 1),
                                error =sapply(failed, "[[", 3)))
  return(errors)
}

new_results <- lapply(aggregateGroup,
                      script = "../../R/summaryStats.R",
                      prefix = "S2-|S3-",
                      testAll)
names(new_results) <- aggregateGroup

new_errors_wQ <- errorFind(new_results[[1]])
new_errors_rN <- errorFind(new_results[[2]])
new_errors_uR <- errorFind(new_results[[3]])


# If you would like to compare the difference between two scripts, (for instance,
# if you have made some changes to the function and would like to see if this
# has changed the functionality of your code), then modify the "script" argument
# below to the SummaryStats script you would like to compare changes against.


old_results <- lapply(aggregateGroup,
                      script = "../../R/archive-scripts/summary-stats-github.R",
                      prefix = "S2-|S3-",
                      testAll)

names(old_results) <- aggregateGroup

# Find errors in all aggregate group tests

old_errors_wQ <- errorFind(old_results[[1]])
old_errors_rN <- errorFind(old_results[[2]])
old_errors_uR <- errorFind(old_results[[3]])

# Compare differences between results
diff <- as.data.frame(all.equal(new_results, old_results))

brinda_results <- lapply(aggregateGroup,
                         script = "../../R/summaryStats.R",
                         prefix = "S2-|S3-",
                         testAll)

# errors_to_fix <-  c("wealthqunitile", old_errors_wQ)

## comparision of function before/after changes

# tofixErrors <- function(compareErrors) {
#   to_fix <- compare_errors[, c("filename", "index", "error.new")]
#   to_fix <- subset(to_fix,!is.na(error.new))
#   return(to_fix)
# }
#
# to_fix <- tofixErrors(compareErrors)
#
# unique_errors <- as.data.frame(table(compare_errors["error.new"]))
#
# tofixerrors <- function(compareerrors) {
#   to_fix <- compare_errors[, c("filename", "index", "error.new")]
#   to_fix <- subset(to_fix,!is.na(error.new))
#   return(to_fix)
# }
#
# errors_to_fix_wQ <-
#   data.frame(c("wealthqunitile", new_errors_wQ), check.names = F)
# errors_to_fix_rN <-
#   data.frame(c("regionname", new_errors_rN), check.names = F)
# errors_to_fix_uR <-
#   data.frame(c("urbanity", new_errors_uR), check.names = F)
#
# errors_to_fix <- cbind(errors_to_fix_wQ, stack(errors_to_fix_rN))
#
#
# unique_errors <- as.data.frame(table(compare_errors["error.new"]))

