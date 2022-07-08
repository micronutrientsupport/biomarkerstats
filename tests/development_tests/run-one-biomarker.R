# To run SummaryStats function over one dataset and micronutrient

# 1) Change working directory to this (source) file's directory
# (Session > Set Working Directory > To Source File Location)

# 2) Place data files in the same location as this script

rm(list = ls())
library(srvyr)
library(jtools)
library(survey)
library(dplyr)
library(BRINDA)

prefix <- "S3-"
biomarkerField <- "zinc"
groupId <- "WRA"
aggregationField <- "wealthQuintile"
RunSurveyWeights <- TRUE

# Load data file
load(file=paste0(prefix, biomarkerField, "-", groupId, "-", aggregationField, "-theData.rda"))

# Load thresholds file
load(file=paste0(biomarkerField, "-", groupId, "-thresholds.rda"))

# run validation test
# source("../../R/validation.R")
# validation(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , groupId = groupId, thresholds = thresholds)

# run SummaryStats function
source("../../R/SummaryStats.R")
with_weights_output <- SummaryStats(theData = theData,
                       biomarkerField = biomarkerField,
                       aggregationField = aggregationField,
                       groupId = groupId,
                       thresholds = thresholds,
                       RunSurveyWeights = TRUE,
                       BRINDA = FALSE,
                       HaemAltAdjust = TRUE,
                       HaemSmokeAdjust = TRUE,
                       ZincAdjust = TRUE)

without_weights_output <- SummaryStats(theData = theData,
                                       biomarkerField = biomarkerField,
                                       aggregationField = aggregationField,
                                       groupId = groupId,
                                       thresholds = thresholds,
                                       RunSurveyWeights = FALSE,
                                       BRINDA = FALSE,
                                       HaemAltAdjust = TRUE,
                                       HaemSmokeAdjust = TRUE,
                                       ZincAdjust = TRUE)

all.equal(with_weights_output, without_weights_output)
