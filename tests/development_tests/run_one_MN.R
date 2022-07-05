rm(list = ls())
library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

biomarkerField <- "zinc"
groupId <- "PSC"
aggregationField = "wealthQuintile"
Flag_SurvWeightRun <- TRUE
Flag_SurvWeightSupplied <- TRUE
Flag_HaemAltAdjust <- FALSE
Flag_SmokeAdjust <- FALSE

# S3-agp-WRA-wealthQuintile-theData
load(file=paste0("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/S3-", biomarkerField, "-", groupId, "-", aggregationField, "-theData.rda"))

# S3-agp-WRA-wealthQuintile-thresholds
load(file=paste0("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/", biomarkerField, "-", groupId, "-thresholds.rda"))

#### Function loading

# run SummaryStats function
source("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/R/SummaryStats.R")
output <- SummaryStats(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)

# run validation test
# validation(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)



######### Load S2 / Malawian data

library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

biomarkerField <- "zinc"
groupId <- "WRA"
aggregationField = "wealthQuintile"
Flag_SurvWeightRun <- TRUE
Flag_SurvWeightSupplied <- TRUE
Flag_HaemAltAdjust <- FALSE
Flag_SmokeAdjust <- FALSE


# S3-agp-WRA-wealthQuintile-theData
load(file=paste0("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/S2-", biomarkerField, "-", groupId, "-", aggregationField, "-theData.rda"))

# S3-agp-WRA-wealthQuintile-thresholds
load(file=paste0("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/", biomarkerField, "-", groupId, "-thresholds.rda"))

#### Function loading

# run SummaryStats function
source("C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/R/SummaryStats.R")
output <- SummaryStats(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)

# run validation test
validation(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)

