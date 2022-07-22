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
biomarkerField <- "zinc"
group_id <- "MEN"
aggregationField <- "wealth_quintile"
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
source("SummaryStats-export.R")
output <- SummaryStats(theData = theData,
                       biomarkerField = biomarkerField,
                       aggregationField = "region",
                       group_id = "WRA",
                       thresholds = thresholds,
                       RunSurveyWeights = TRUE,
                       Brinda = TRUE,
                       HaemAltAdjust = TRUE,
                       HaemSmokeAdjust = TRUE,
                       ZincCutoff = TRUE)

 output$totalStats[,c("mean", "lowerQuartile", "upperQuartile")]

withoutBRINDA <- SummaryStats(theData = theData,
                       biomarkerField = "haemoglobin",
                       aggregationField = "region",
                       group_id = "WRA",
                       thresholds = thresholds,
                       RunSurveyWeights = TRUE,
                       Brinda = TRUE,
                       HaemAltAdjust = TRUE,
                       HaemSmokeAdjust = TRUE,
                       ZincCutoff = TRUE)

diff_brinda <- as.data.frame(all.equal(output,withoutBRINDA))


without_weights_output <- SummaryStats(theData = theData,
                                       biomarkerField = biomarkerField,
                                       aggregationField = aggregationField,
                                       group_id = group_id,
                                       thresholds = thresholds,
                                       RunSurveyWeights = FALSE,
                                       BRINDA = FALSE,
                                       HaemAltAdjust = TRUE,
                                       HaemSmokeAdjust = TRUE,
                                       ZincAdjust = TRUE)

all.equal(with_weights_output, without_weights_output)
