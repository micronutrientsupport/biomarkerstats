rm(list = ls())
library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

prefix <- "S3-"
biomarkerField <- "zinc"
groupId <- "PSC"
aggregationField = "wealthQuintile"
Flag_SurvWeightRun <- TRUE
Flag_SurvWeightSupplied <- TRUE
Flag_HaemAltAdjust <- FALSE
Flag_SmokeAdjust <- FALSE

# S3-agp-WRA-wealthQuintile-theData
load(file=paste0(prefix, biomarkerField, "-", groupId, "-", aggregationField, "-theData.rda"))

# S3-agp-WRA-wealthQuintile-thresholds
load(file=paste0(biomarkerField, "-", groupId, "-thresholds.rda"))

## Function loading

# run SummaryStats function
source("../../R/SummaryStats.R")
output <- SummaryStats(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)

# run validation test
source("../../R/validation.R")
validation(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)
