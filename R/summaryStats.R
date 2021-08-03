
#' Biomarker Data
#'
#' Does some stuff
#'
#' @param theData the data
#' @param groupId the group
#' @param biomarkerField the field name of the biomarker measurement data
#' @param aggregationField the field name to aggregate by
#' @param thresholds the thresholds
#'
#' @importFrom magrittr %>%
#'
#' @return output
#' @export
#'
#' @examples
SummaryStats <- function(theData, biomarkerField, aggregationField, groupId, thresholds) {

  #### Bring in data ####
  MyGp <- groupId # change this to change the demographic group data used
  DataUse <- theData # this is the participant and biomarker data
  aggField <- aggregationField # this is name of the data field to be used for aggregation
  bmField <- biomarkerField # column name for the biomarker data
  bmName <- biomarkerField
  MyMN <- which(colnames(DataUse) == bmField) # column number for the biomarker data
  MyAgg <- which(colnames(DataUse) == aggField) # column number for the aggregation field

  # Defaulting isPregnant to 0 where NA
  DataUse[which(is.na(DataUse$isPregnant)), ]$isPregnant <- 0
  DataUse[which(is.na(DataUse$surveyStrata)), ]$surveyStrata <- 0
  DataUse$surveyWeights <- as.integer(DataUse$surveyWeights)
  DataUse$surveyStrata <- as.integer(DataUse$surveyStrata)

  # PhysLimits<-read.csv() # this is a table with physiological limit for each MN
  PhysLim <- 6000 # fixed figure until a csv to import

  #### Flags to accomodate differences between surveys
  Flag_SurvWeightRun <- 0 # where 1 = 'run' as not adjusted in the supplied data and 0 = 'do not run' as already adjusted
  Flag_SurvWeightSUpplied <- 0 # where not supplied set to 0, supplied = 1. Run if above = 1.
  Flag_HaemAltAdjust <- 0 # Adjustment not run (0) where already adjusted in the supplied data, run if = 1.
  Flag_SmokeAdjust <- 0 # Adjustment not run (0) where already adjusted in the supplied data, or smoking not recorded so cannot adjust

  #### Eligible data selection ####
  DataUse[, MyMN] <- as.numeric(unlist(get(bmField, DataUse))) # Make sure the biomarker column values are numeric

  DataUse <- DataUse[!(is.na(get(bmField, DataUse))), ] # omit row with NA in the col of interest
  DataUse <- DataUse[!(is.na(get(aggField, DataUse))), ] # omit row with NA in the aggregation column

  DataUse <- DataUse[which(get(bmField, DataUse) <= PhysLim), ] # Excluding physiological implausible concentrations for the specific MN


  # assign age categories, then exclude the '0' rows
  DataUse$AgeCat <- ifelse(DataUse$groupId == "WRA",
    ifelse(DataUse$ageInMonths >= (15 * 12) & DataUse$ageInMonths < (20 * 12), 1, ifelse(DataUse$ageInMonths >= (20 * 12) & DataUse$ageInMonths < (50 * 12), 2, 0)),
    ifelse(DataUse$groupId == "PSC",
      ifelse(DataUse$ageInMonths >= (0.5 * 12) & DataUse$ageInMonths < (2 * 12), 1, ifelse(DataUse$ageInMonths >= (2 * 12) & DataUse$ageInMonths < (5 * 12), 2, 0)),
      ifelse(DataUse$groupId == "SAC",
        ifelse(DataUse$ageInMonths >= (5 * 12) & DataUse$ageInMonths < (11 * 12), 1, ifelse(DataUse$ageInMonths >= (12 * 12) & DataUse$ageInMonths < (15 * 12), 2, 0)),
        ifelse(DataUse$groupId == "MEN",
          ifelse(DataUse$ageInMonths >= (15 * 12) & DataUse$ageInMonths < (30 * 12), 1, ifelse(DataUse$ageInMonths >= (30 * 12) & DataUse$ageInMonths < (54 * 12), 2, 0)),
          0
        )
      )
    )
  )

  DataUse <- DataUse[which(DataUse$AgeCat > 0), ]
  DataUse$DemoGpCat <- paste(DataUse$groupId, ".", DataUse$AgeCat)


  DataUse <- DataUse[which(DataUse$isPregnant != 1), ] # exclude pregnant

  #### Adjustments ####

  # E.g. haemoglobin adjustment for altitude

  # E.g. haemoglobin adjustment for smoking

  #### Calculate deficiency / excess ####

  # iterate over the thresholds proivided and update DataUse to hold 1/0 values
  # if those thresholds are met
  for (thresholdName in names(thresholds)) {
    # print(thresholdName)
    # print(thresholds[[thresholdName]])

    lower <- as.numeric(thresholds[[thresholdName]]$lower)
    upper <- as.numeric(thresholds[[thresholdName]]$upper)

    # Default case for 'basic' thresholds
    if (is.null(lower)) {
      DataUse[[thresholdName]] <- ifelse(DataUse[, MyMN] <= upper, 1, 0)
    } else if (is.null(upper)) {
      DataUse[[thresholdName]] <- ifelse(DataUse[, MyMN] > lower, 1, 0)
    } else {
      DataUse[[thresholdName]] <- ifelse(DataUse[, MyMN] > lower & DataUse[, MyMN] <= upper, 1, 0)
    }
  }

  if (bmName == "zinc") {
    # Something special for zinc as its thresholds are complicated
  }

  #### Create Survey Weights for deficiency calculations ####
  # Adjust by survey weight where not already done AND weights supplied, *else* run without use weights to get common output format
  #  make sure cluster, strat and weight always have the same name and structure (weight to divide by 1000000)
  if (Flag_SurvWeightRun == 1 & Flag_SurvWeightSUpplied == 1) {
    DHSdesign <- survey::svydesign(id = DataUse$cluster, strata = DataUse$strata, weights = DataUse$weights / 1000000, data = DataUse, nest = TRUE)
    options("survey.lonely.psu" = "adjust")
  } else {
    DHSdesign <- survey::svydesign(ids = ~1, strata = NULL, weights = NULL, data = DataUse)
  }

  #### Stats for the survey as a whole ####
  mean <- survey::svymean(~ DataUse[, MyMN], DHSdesign, ci = FALSE)
  quant <- survey::svyquantile(~ DataUse[, MyMN], DHSdesign, c(.25, .5, .75), ci = FALSE)
  print(quant)
  quant <- data.frame(quant)
  print(colnames(quant))
  colnames(quant) <- c("X0.25", "X0.5", "X0.75")
  print(quant)
  print(colnames(quant))
  sd <- jtools::svysd(~ DataUse[, MyMN], DHSdesign)
  n <- nrow(DataUse)
  summary <- cbind(mean, quant, sd, n)
  summary <- data.frame(summary)
  rownames(summary) <- c(1)


  print(colnames(summary))
  print(summary)

  # Rename output fields as appropriate
  summary <- summary %>%
    srvyr::mutate(IQR = X0.75 - X0.25) %>%
    srvyr::mutate(
      out_upp = X0.75 + 1.5 * IQR,
      out_low = X0.25 - 1.5 * IQR
    ) %>%
    srvyr::rename(
      "median" = X0.5,
      "lowerQuartile" = X0.25,
      "upperQuartile" = X0.75,
      "upperOutlier" = out_upp,
      "lowerOutlier" = out_low,
      "standardDeviation" = sd
    ) %>%
    srvyr::select(mean, median, standardDeviation, lowerQuartile, upperQuartile, upperOutlier, lowerOutlier, n)




  thresh <- list()
  #### Calculate deficiency percentages for all threshold levels
  for (thresholdName in names(thresholds)) {
    thresh[[thresholdName]] <- survey::svyby(as.formula(paste("~", thresholdName)), ~ DataUse[, MyAgg], DHSdesign, survey::svyciprop, vartype = "ci")
    # Rename output fields as appropriate
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "DataUse[, MyAgg]"] <- "aggregation"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "deficiency"] <- "percentage"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_l"] <- "confidenceIntervalLower"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_u"] <- "confidenceIntervalUpper"
  }
  # print(thresh)

  #### Calculate weighted survey summary statistics
  options("survey.lonely.psu" = "adjust")
  strat_design_srvyr <- DataUse %>%
    srvyr::rename("aggregation" = aggField) %>%
    srvyr::rename("biomarker" = bmName) %>%
    srvyr::mutate(aggregation = as.factor(aggregation)) %>%
    srvyr::mutate(biomarker = as.numeric(biomarker)) %>%
    srvyr::as_survey_design(id = surveyCluster, strata = surveyStrata, weights = surveyWeights, nest = TRUE)
  # print(strat_design_srvyr)
  stat <- strat_design_srvyr %>%
    srvyr::group_by(aggregation) %>%
    srvyr::summarise(
      mean = srvyr::survey_mean(biomarker),
      sd = srvyr::survey_sd(biomarker),
      Q = srvyr::survey_quantile(biomarker, c(0.25, 0.5, 0.75)),
    ) %>%
    srvyr::mutate(IQR = Q_q75 - Q_q25) %>%
    srvyr::mutate(
      out_upp = Q_q75 + 1.5 * IQR,
      out_low = Q_q25 - 1.5 * IQR
    )
  stat$aggregation <- as.integer(stat$aggregation)

  #### Also need N count.  For now calculate using 'base R' and append to the srvyr stats table
  basicSummary <- psych::describeBy(get(bmField, DataUse), get(aggField, DataUse), mat = TRUE, digits = 2) %>% srvyr::select(
    group1, n
  )
  basicSummary$group1 <- as.integer(basicSummary$group1)

  combinedStats <- dplyr::left_join(stat, basicSummary, by = c("aggregation" = "group1"))

  # Select only the fields needed and rename as appropriate
  combinedStats <- combinedStats %>%
    srvyr::rename(
      "median" = Q_q50,
      "lowerQuartile" = Q_q25,
      "upperQuartile" = Q_q75,
      "upperOutlier" = out_upp,
      "lowerOutlier" = out_low,
      "standardDeviation" = sd
    ) %>%
    srvyr::select(aggregation, mean, median, standardDeviation, lowerQuartile, upperQuartile, upperOutlier, lowerOutlier, n)

  #### Select the outliers
  dataWithStats <- dplyr::left_join(stat, DataUse, by = c("aggregation" = aggField))
  # print(dataWithStats)
  outliers <- dataWithStats %>%
    srvyr::rename("measurement" = bmName) %>%
    srvyr::filter(measurement < out_low | measurement > out_upp) %>%
    srvyr::select(measurement, aggregation)
  # print(outliers)

  output <- list(
    "totalStats" = summary,
    "aggregatedStats" = combinedStats,
    "aggregatedOutliers" = outliers,
    "aggregatedThresholds" = thresh
  )

  #### end ####
  return(output)
}
