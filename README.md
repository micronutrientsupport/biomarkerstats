---
author:
- Fanny Sandalinas
authors:
- Fanny Sandalinas
date: 2024-10-07
title: Quarto documentation
toc-title: Table of contents
---

## Preface

About this manual This manual is designed for anyone involved in the
analysis of micronutrient biomarkers datasets. The methods were
developed by the Micronutrient Action Policy Support (MAPS) project and
made available to all for use, without warranty or liability. The MAPS
project is funded by the Bill and Melinda Gates Foundation.

## Authors

Fanny Sandalinas, Tineka Blake

## Acknowledgements

Christopher Chagumaira, Andrew Bean, Edward Joy, Louise Ander

## Who is this manual for

The goal of this documentation is to help nutritionists and data
scientists to analyse datasets more quickly while remaining in full
control of the decisions being made, with clear notation of the
decisions made at every step. It will help them to better understand the
data and obtain accurate estimates of micronutrient status, in a
harmonized, reproducible and transparent way.

## Introduction

Welcome to the training manual on using R and Rstudio for the analysis
of micronutrient biomarker data. The parts on software requirements,
data types, data structures, packages and functions can be learnt
through this documentation: R for Household Consumption and Expenditure
Surveys, as these parts cover the bases of R.

## Summary stat function

The aim of the function is to create the summary statistics that are
needed when analysing micronutrient biomarker data. That includes
estimates of deficiency based on cut-offs, with disaggregation by
socio-demographic characteristics, mean concentration of the
micronutrient biomarkers, and histogram of distribution.

The function can produce summary statistics for serum/plasma: ferritin,
soluble transferrin receptors (sTfR), hemoglobin, Retinol Binding
Protein (RBP), iodine, retinol, zinc, vitamin B9, vitamin B12.

The SummaryStats function has been broken down into a series of smaller
sub-functions. Each sub-function performs a specific task,
i.e. preprocessing, applying a specific adjustment, etc. This has been
implemented to make the large body of code more digestable,
interpretable and resuable over different source files.

The SummaryStats function is therefore a series of sub-function calls
that can be executed with the default parameters with the following
line: SummaryStats(theData = theData, biomarkerField = biomarkerField,
aggregationField = "region", group_id = "WRA", thresholds = thresholds)

## Loading the function

Change working directory to this (source) file's directory

(Session \> Set Working Directory \> To Source File Location)

# `{r} # source("../R/SummaryStats.R") #`

You will also need to download a few files that are all available in the
same folder. You do not need to do anything with these files, just make
sure they are in the same folder than your data. More explanation on
these files can be found here: SummaryStats-requirements.

Place data files in the same location as this script.

-   The data (S3-biomarker-group_id-variable\_-theData.rda) The data
    must be in a .rda file. You can use a function to transform your
    data in the right format into .rda.

-   Threshold files ('biomarker-group_id-thresholds) They are available
    for every micronutrient by age group. The right threshold file will
    be loaded once the specifications of the micronutrient and age group
    are entered in the summary stat function parameters.

-   Text file ('S3-biomarker-group_id-variable-source.txt) The text file
    calls the function with the right parameters.

download and load a few packages that are needed

# `{r} # rm(list = ls())  # library(srvyr)  # library(jtools)  # library(survey)  # library(dplyr)  # library(BRINDA) #  #`

## Preparation of the data

To be able to run the function on your data, make sure your data follow
exactly the same - name - units - format than indicated in this: Sample
File WRA. The variable names are case-sensitive.

Some of the variables are mandatory: Biomarker data: at least one
biomarker variable should be provided If zinc data are provided, then
fasting information, timing of sample collection and age group for
school-age children should be provided to apply the right cutoff to the
values. If vitamin B12 data are provided, exact age of the child in
month should be provided so that the right cut-off is used.

Some others are optional: CRP and AGP: these variables are inflammatory
markers and are used to adjust data for inflammation. if they are not
present, the BRINDA package will not be applied (see later in 2.3.2) and
the summary statistics will be unadjusted. Weight: if weights were
applied during the survey, the original weights must be provided so that
the design of the survey is taken into account in summary estimates.
Survey cluster and survey strata: if the survey was using a complex
survey design, then providing the survey cluster and the survey strata
will allow the use of a survey package (see 2.3.3) to take into account
survey design characteristics in the analysis of data. Aggregation
variables. The function performs some basic level of aggregation: •
Rural/urban • Wealth quintiles • Age group

## Pre-processing of data

Outliers should be removed manually. We recommend to remove values
(changing to NA) following these guidance: Zinc Data Remove values of
serum/plasma zinc\>161 μg/dL

Haemoglobin haemoglobin\<4 g/dL haemoglobin\>18 g/dL

Other biomarkers

There are no publications related to implausible values for the other
biomarkers and therefore the approach should be conservative, but
removing values that are likely to be resulting from errors in data
entry or biologically implausible.

::: cell
``` {.r .cell-code}
## Run SummaryStats function over one dataset and micronutrient


prefix <- "S3-"
biomarkerField <- "haemoglobin"
group_id <- "WRA"
```
:::

The function can work on several population groups of interest:
Pre-school children, school-age children, women of reproductive age and
men.

Pregnant women should be removed from the dataset.

It is important to chose the right population of interest as specific
cutoff are and the use of inflammation adjustment also depends on the
population group that has been chosen.

# `{r} # knitr::opts_chunk$set(echo = TRUE) # aggregationField <- "region" #  #`

Currently, the function can disaggregate results by region, wealth
quintiles and residence (urban or rural)

# `{r} # RunSurveyWeights <- TRUE #`

The R survey package is used in the function to be able to take survey
characteristics into account. This is particularly important for the
estimation of the standard deviation as it is assumed that there is less
variations between individuals of the same cluster, and the same strata
than in the entire sample. If these characteristics are not entered,
then the results will not be representative of the total sample.

# `{r} # Brinda <- TRUE #`

The inflammation adjustment can be performed using AGP or CRP only. For
more information related to the inflammation adjustment using the BRINDA
package, refer to Luo et al.

# `{r} # HaemAltAdjust <- TRUE #`

Heamoglobin increases with altitude and therefore haemoglobin values
should be adjusted for altitude so that they can be compared to
sea-level values. The default argument is set to TRUE, if you would not
like to apply this adjustment set HaemAltAdjust = FALSE The adjustement
follows the equation described in Sharma et al.

::: cell
``` {.r .cell-code}
HaemSmokeAdjust <- TRUE
```
:::

Smoking increases haemoglobin values and therefore haemoglobin values
should be adjusted for smoking status, so they can be compared to
non-smoker values. This function assumes the amount of cigarettes per
day is not known and assesses only if the individual is a smoker or not.
The default argument is set to TRUE, if you would not like to apply this
adjustment setHaemSmokeAdjust = FALSE. The smoking adjustment follows
the equation described in Sharma et al.

Load data file

# `{r} # load(file=paste0(prefix, biomarkerField, "-", group_id, "-", aggregationField, "-theData.rda")) #`

# Load thresholds file

# `{r} # load(file=paste0(biomarkerField, "-", group_id, "-thresholds.rda")) #`

Make sure that the arguments of the function equal the same as the
loaded data and thresholds file

# `{r} # source("../../R/SummaryStats.R") # output <- SummaryStats(theData = theData, #                        biomarkerField = "haemoglobin", #                        aggregationField = "region", #                        group_id = "WRA", #                        thresholds = thresholds, #                        RunSurveyWeights = TRUE, #                        Brinda = TRUE, #                        HaemAltAdjust = TRUE, #                        HaemSmokeAdjust = TRUE, #                        ZincCutoff = TRUE) #  #`

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
