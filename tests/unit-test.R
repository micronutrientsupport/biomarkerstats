# test new function 
# Wealth Quintile 

setwd("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3")
files <- strsplit(list.files(, "-wealthQuintile-theData.rda"), "-wealthQuintile-theData.rda")
files <- lapply(files, function(x) gsub(x = x, pattern = "S3-", replacement = ""))

testnewWQ <- function (x){
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-", x,"-wealthQuintile-theData.rda"),envir=globalenv())
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/thresholds/", x,"-thresholds.rda"), envir=globalenv())
        
        tryCatch(
                {
                        source("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/R/summaryStats.R")
                        
                        wealthquintile <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-",x,"-wealthQuintile-source.txt"))
                        return(list(x,TRUE,wealthquintile[[1]]
                                    # ,regionName[[1]]
                                    # ,urbanity[[1]] 
                                    ))
                },
                error=function(cond)  {
                        message(cond) 
                        return(list(x,FALSE,toString(cond)))}
        )
}
new_results_WQ <- lapply(files, testnewWQ)

# test new function 
# Region Name

testnewRN <- function (x){
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-", x,"-regionName-theData.rda"),envir=globalenv())
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/thresholds/", x,"-thresholds.rda"), envir=globalenv())
        
        tryCatch(
                {
                        source("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/R/summaryStats.R")
                        
                        regionName <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-",x,"-regionName-source.txt"))
                        
                        return(list(x,TRUE,regionName[[1]]))
                },
                error=function(cond)  {
                        message(cond) 
                        return(list(x,FALSE,toString(cond)))}
        )
}
new_results_rN <- lapply(files, testnewRN)

# test new function 
# Urbanity


testnewUr <- function (x){
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-", x,"-urbanity-theData.rda"),envir=globalenv())
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/thresholds/", x,"-thresholds.rda"), envir=globalenv())
        
        tryCatch(
                {
                        source("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/R/summaryStats.R")

                        urbanity <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/v2_Ethiopia/S3/S3-",x,"-urbanity-source.txt"))
                        
                        return(list(x,TRUE,urbanity[[1]]))
                },
                error=function(cond)  {
                        message(cond) 
                        return(list(x,FALSE,toString(cond)))}
        )
}
new_results_Ur <- lapply(files, testnewUr)


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




#### Old format

# Test summaryStats function on latest Ethiopian data 

# Test original data 
setwd("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/88_tests/R-inputs/S3")
files <- strsplit(list.files(, "-thresholds.rda"), "-thresholds.rda")
function (x){
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/88_tests/R-inputs/S3/S3-WRA-theData.rda"),envir=globalenv())
        
        load(file=paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/88_tests/R-inputs/S3/", x,"-thresholds.rda"), envir=globalenv())
        
        tryCatch(
                {
                        source("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/R/SummaryStats.R")
                        
                        wQ <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/88_tests/R-inputs/S3/",x,"-source.txt"))
                        
                        rG <- source(paste0("C:/Users/Lenovo/Documents/University_of_Nottingham/biomarkerstats/tests/88_tests/R-inputs/S3/",x,"-region-source.txt"))
                        
                        return(list(x,TRUE,wQ[[1]],rG[[1]]))
                },
                error=function(cond)  {
                        message(cond)
                        return(list(x,FALSE,toString(cond)))
                }
        )
}
original_results <- lapply(files, test_original)
