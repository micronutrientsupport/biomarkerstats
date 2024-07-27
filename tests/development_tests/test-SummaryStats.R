## Development tool - Tests SummaryStats function over multiple datasets to
## see which datasets / parts of SummaryStats function are erroneous

# 1) Change working directory to this (source) file's directory
# (RStudio: Session > Set Working Directory > To Source File Location)

# 2) Place data files in the same location as this script

library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

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

# Aggregate groups to analyse
aggregateGroup <- c("wealth_quintile", "region", "urbanity")

# run function over all files in current directory
new_results <- lapply(aggregateGroup,
                      script = "../../R/summaryStats.R",
                      prefix = "S2-|S3-",
                      testAll)

names(new_results) <- aggregateGroup

new_errors_wealth_quintile <- errorFind(new_results[[1]])
new_errors_region <- errorFind(new_results[[2]])
new_errors_urbanity <- errorFind(new_results[[3]])

# If you would like to run the Script over just Malawi OR Ethiopia files
# Change prefix = "S2-" or "S3-" to match country code
# Remove S2/S3 files completely from the directory
# (do not add the to a sub-directory the source directory)

# If you would like to compare the difference between two scripts, (for instance,
# if you have made some changes to the function and would like to see if this
# has changed the functionality of your code), then modify the "script" argument
# below to the SummaryStats script you would like to compare changes against.

# Run a different version of the script with all "S2 & S3" files

old_results <- lapply(aggregateGroup,
                      script = ,# link to old script version
                      prefix = "S2-|S3-",
                      testAll)

#  Find errors in all aggregate group tests

old_errors_wealth_quintile <- errorFind(old_results[[1]])
old_errors_region <- errorFind(old_results[[2]])
old_errors_urbanity <- errorFind(old_results[[3]])

# # Compare differences between results
 diff <- as.data.frame(all.equal(new_results, old_results))

## If you would like to "walk through the function" to investigate how it works:

aggregateGroup <- "region"
script <- "../../R/summaryStats.R"
prefix <- "S2-"
extension <- paste0("-", aggregateGroup, "-theData.rda")
files <- strsplit(list.files (".", extension), extension)
x <- "S2-agp-MEN"

# Now you can execute the testAll function line by line.
