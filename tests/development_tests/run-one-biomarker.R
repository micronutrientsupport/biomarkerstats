## Run SummaryStats function over one dataset and micronutrient

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
biomarkerField <- "haemoglobin"
group_id <- "WRA"
aggregationField <- "region"
RunSurveyWeights <- TRUE
Brinda <- TRUE
HaemAltAdjust <- TRUE
HaemSmokeAdjust <- TRUE
ZincCutoff <- TRUE

# Load data file
load(file=paste0(prefix, biomarkerField, "-", group_id, "-", aggregationField, "-theData.rda"))

# Load thresholds file
load(file=paste0(biomarkerField, "-", group_id, "-thresholds.rda"))

# run validation test
# source("../../R/validation.R")
# validation(theData = theData, biomarkerField = biomarkerField, aggregationField = aggregationField , group_id = group_id, thresholds = thresholds)

# run SummaryStats function

## Make sure that the arguments of the function equal the same as the loaded data and thresholds
## file

source("../../R/SummaryStats.R")
output <- SummaryStats(theData = theData,
                       biomarkerField = "haemoglobin",
                       aggregationField = "region",
                       group_id = "WRA",
                       thresholds = thresholds,
                       RunSurveyWeights = TRUE,
                       Brinda = TRUE,
                       HaemAltAdjust = TRUE,
                       HaemSmokeAdjust = TRUE,
                       ZincCutoff = TRUE)

# If one would like to compare the difference of one dataset with and without
# without weights (please use test_SummaryStats.R to test differences
# among all datasets)

with_weights <- SummaryStats(theData = theData,
                       biomarkerField = "haemoglobin",
                       aggregationField = "region",
                       group_id = "WRA",
                       thresholds = thresholds,
                       RunSurveyWeights = TRUE, # set to true (with weights)
                       Brinda = TRUE,
                       HaemAltAdjust = TRUE,
                       HaemSmokeAdjust = TRUE,
                       ZincCutoff = TRUE)

without_weights <- SummaryStats(theData = theData,
                                       biomarkerField = biomarkerField,
                                       aggregationField = aggregationField,
                                       group_id = group_id,
                                       thresholds = thresholds,
                                       RunSurveyWeights = FALSE, #set to false
                                       BRINDA = TRUE,
                                       HaemAltAdjust = TRUE,
                                       HaemSmokeAdjust = TRUE,
                                       ZincAdjust = TRUE)

all.equal(with_weights, without_weights)
