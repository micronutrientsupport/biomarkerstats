#' Biomarker Data
#'
#' Computes summary statistics for National Micronutrient Surveys
#'
#' @param theData the data
#' @param groupId the group
#' @param biomarkerField the field name of the biomarker measurement data.
#' When a zero value is observed in the biomarkerField, there is a nominal value
#' of 0.001 added to the zero value in order to #' facilitate statistical
#' computation (in particular Log transform in the BRINDA package)
#' @param aggregationField the field name to aggregate by
#' @param thresholds the thresholds
#' @param Flag_SurvWeightRun If survey weights have already been run (?) set
#' Flag_SurvWeightRun = TRUE, else default is FALSE and the survey weights will
#' be run
#' @param Flag_SurvWeightSupplied If survey weights have already been supplied (?) set
#' Flag_SurvWeightupplied = TRUE, else default is FALSE
#' @param Flag_HaemAltAdjust If Haemogoblin adjustment for altitude has already
#' been applied set Flag_HaemAltAdjust = TRUE, else default is FALSE and the
#' Haemoglobin will be adjusted
#' @param Flag_SmokeAdjust If Haemogoblin adjustment for smoking status has already
#' been applied set Flag_HaemAltAdjust = TRUE, else default is FALSE and the
#' Haemoglobin will be adjusted
#'
#' @importFrom magrittr %>%
#' @import srvyr jtools survey dplyr BRINDA
#'
#' @return output
#' @export
#' @examples

SummaryStats <- function(theData,
                         biomarkerField,
                         aggregationField,
                         groupId,
                         thresholds,
                         Flag_SurvWeightRun = FALSE,
                         Flag_SurvWeightSupplied = FALSE,
                         Flag_HaemAltAdjust = FALSE,
                         Flag_SmokeAdjust = FALSE
                         ){
                  DataUse <- theData

                  # Assign the correct datatypes and remove incomplete data fields
                  preprocessData <- function (DataUse){
                    DataUse[,"surveyStrata"][is.na(DataUse[,"surveyStrata"])] <- 0
                    DataUse[,c("surveyStrata","surveyWeights")] <- lapply(DataUse[,c("surveyStrata","surveyWeights")], as.integer)
                    DataUse[,biomarkerField] <- as.numeric(DataUse[,biomarkerField])
                    DataUse[,aggregationField] <- as.character(DataUse[,aggregationField])
                    DataUse <- DataUse[complete.cases(DataUse[biomarkerField]) ,]
                    DataUse <- DataUse[complete.cases(DataUse[aggregationField]),]
                    DataUse <- DataUse[DataUse[,"groupId"] == groupId,]
                    DataUse[,"isPregnant"] <- as.logical(DataUse[,"isPregnant"])
                    DataUse <- DataUse[is.na(DataUse["isPregnant"])|DataUse["isPregnant"]== FALSE,]
                    # Select values that are under the physiological limit for micronutrients
                    PhysLim <- 6000
                    DataUse <- DataUse[which(get(biomarkerField, DataUse) <= PhysLim), ]
                    return(DataUse)
                  }
                  DataUse <- preprocessData(DataUse)

                  zeroNegative <- function (DataUse){
                    DataUse[,biomarkerField] <- ifelse(DataUse[,biomarkerField] == 0,
                                                       0.001,
                                                       DataUse[,biomarkerField])
                    DataUse <- subset(DataUse, get(biomarkerField) > 0)
                    return(DataUse)
                  }
                  DataUse <- zeroNegative(DataUse)

                  # # BRINDA Adjustments
                  #
                  # adjust <- c("agp", "crp", "rbp", "retinol",
                  #                  "ferritin", "stfr", "zinc")
                  # # make sure this doesn't produce an error, if column names aren't in dataset
                  # # add to validation
                  #
                  # DataUse[adjust] <- lapply(DataUse[adjust], as.numeric)
                  #
                  # DataUse <- BRINDA(dataset = DataUse,
                  #
                  #                   zinc_varname = zinc,
                  #                   crp_varname = crp,
                  #                   agp_varname = agp,
                  #                   population = WRA, #### change for each pop group
                  #                   crp_ref_value_manual = ,
                  #                   agp_ref_value_manual = ,
                  #                   output_format = )

                  # DataUse[, biomarkerField]<- ifelse(biomarkerField == "rbp", DataUse["rbp_adj"],
                  #                                    ifelse(biomarkerField == "retinol", DataUse["sr_adj"],
                  #                                           ifelse(biomarkerField == "ferritin", DataUse["sf_adj"],
                  #                                                  ifelse(biomarkerField == "stfr", DataUse["stfr_adj"],
                  #                                                         ifelse(biomarkerField == "zinc", DataUse["zn_adj"],
                  #                                                                DataUse[biomarkerField])
                  #                                                  )
                  #                                           )
                  #                                    )
                  # )
                  #


                  # Assign age categories to individuals
                  ageCategories <- function (DataUse){
                    id <- DataUse[,"groupId"]
                    age <-DataUse[,"ageInMonths"]
                    y <- 12
                    DataUse[,"AgeCat"] <- ifelse(id == "WRA",
                                                 ifelse(age >= (15*y) & age < (20*y), 1, ifelse(age >= (20*y) & age < (50*y), 2, NA)),
                                                 ifelse(id == "PSC",
                                                        ifelse(age >= (0.5*y) & age < (2*y), 1, ifelse(age >= (2*y) & age < (5*y), 2, NA)),
                                                        ifelse(id == "SAC",
                                                               ifelse(age >= (5*y) & age < (12*y), 1, ifelse(age >= (12*y) & age < (15*y), 2, NA)),
                                                               ifelse(id == "MEN",
                                                                      ifelse(age >= (15*y) & age < (30*y), 1, ifelse(age >= (30*y) & age < (55*y), 2, NA)),
                                                                      NA
                                                               )
                                                        )
                                                 )
                    )
                    DataUse <- DataUse[complete.cases(DataUse["AgeCat"]),]
                    DataUse[,"DemoGpCat"] <- paste0(id, ".",DataUse[,"AgeCat"])
                    return(DataUse)
                  }
                  DataUse <- ageCategories(DataUse)

                    thresh <- list()
                    for (thresholdName in names(thresholds)) {
                            lower <- as.numeric(thresholds[[thresholdName]]$lower)
                            upper <- as.numeric(thresholds[[thresholdName]]$upper)
                            if (length(lower)==0) {
                                    DataUse[[thresholdName]] <- ifelse(DataUse[, biomarkerField] <= upper, TRUE, FALSE)
                            } else if (length(upper)==0) {
                                    DataUse[[thresholdName]] <- ifelse(DataUse[, biomarkerField] > lower, TRUE, FALSE)
                            } else {
                                    DataUse[[thresholdName]] <- ifelse(DataUse[, biomarkerField] > lower & DataUse[, biomarkerField] <= upper, TRUE, FALSE)
                            }
                    }

                  # Create a Demographic and Health Survey (DHS)
                  if (Flag_SurvWeightRun == TRUE & Flag_SurvWeightSupplied == TRUE) {
                          DHSdesign <- survey::svydesign(id = DataUse[,"surveyCluster"], strata = DataUse[,"surveyStrata"], weights = DataUse[,"surveyWeights"] / 1000000, data = DataUse, nest = TRUE)
                          options("survey.lonely.psu" = "adjust")
                  } else {
                          DHSdesign <- survey::svydesign(ids = ~1, strata = NULL, weights = NULL, data = DataUse)
                  }

                  # compute statistics for DHS
                  mean <- survey::svymean(~ DataUse[, biomarkerField], DHSdesign, ci = FALSE)
                  quantiles <- survey::oldsvyquantile(~ DataUse[, biomarkerField],
                                                      DHSdesign, c(.25, .5, .75),
                                                      ci = FALSE)
                  sd <- jtools::svysd(~ DataUse[, biomarkerField], DHSdesign)
                  n <- nrow(DataUse)
                  summary <- as.data.frame(cbind(mean, quantiles, sd, n))
                  summary <- srvyr::rename(summary,
                                    lowerQuartile = "0.25",
                                    median = "0.5",
                                    upperQuartile = "0.75",
                                    standardDeviation = "sd")
                  lowerQuartile <- summary[,"lowerQuartile"]
                  upperQuartile <- summary[,"upperQuartile"]
                  summary <- summary %>%
                          srvyr::mutate(IQR = upperQuartile - lowerQuartile) %>%
                          srvyr::mutate(
                                  upperOutlier = upperQuartile + 1.5 * IQR,
                                  lowerOutlier = lowerQuartile - 1.5 * IQR
                          ) %>%
                          srvyr::select(mean, median,
                                        standardDeviation,
                                        lowerQuartile,
                                        upperQuartile,
                                        upperOutlier,
                                        lowerOutlier, n)
                    rownames(summary) <- NULL

                    # Calculate deficiency percentages for all threshold levels
                    thresh <- list()
                    for (thresholdName in names(thresholds)) {
                            thresh[[thresholdName]] <- survey::svyby(as.formula(paste("~", thresholdName)), ~ DataUse[, aggregationField], DHSdesign, survey::svyciprop, vartype = "ci")
                            names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "DataUse[, aggregationField]"] <- "aggregation"
                            names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "deficiency"] <- "percentage"
                            names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_l"] <- "confidenceIntervalLower"
                            names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_u"] <- "confidenceIntervalUpper"
                            rownames(thresh[[thresholdName]]) <- NULL
                    }

                    # Calculate weighted survey summary statistics
                    weightedStats <- function (DataUse){
                    options("survey.lonely.psu" = "adjust")
                    strat_design_srvyr <- DataUse %>%
                            srvyr::rename("aggregation" = all_of(aggregationField)) %>%
                            srvyr::rename("biomarker" = all_of(biomarkerField)) %>%
                            srvyr::mutate(aggregation = as.factor(aggregation)) %>%
                            srvyr::mutate(biomarker = as.numeric(biomarker)) %>%
                            srvyr::as_survey_design(id = surveyCluster,
                                                    strata = surveyStrata,
                                                    weights = surveyWeights,
                                                    nest = TRUE)
                     stat <- strat_design_srvyr %>%
                            srvyr::group_by(aggregation) %>%
                            srvyr::summarise(
                                    mean = srvyr::survey_mean(biomarker),
                                    standardDeviation = srvyr::survey_sd(biomarker),
                                    Q = srvyr::survey_quantile(biomarker, c(0.25, 0.5, 0.75)),
                            ) %>%
                            srvyr::mutate(IQR = Q_q75 - Q_q25) %>%
                            srvyr::mutate(
                                    upperOutlier = Q_q75 + 1.5 * IQR,
                                    lowerOutlier = Q_q25 - 1.5 * IQR
                            )
                    stat <- stat %>%
                            srvyr::rename("median" = Q_q50,
                                          "lowerQuartile" = Q_q25,
                                          "upperQuartile" = Q_q75)
                    stat$aggregation <- as.character(stat$aggregation)
                    return(stat)
                    }
                    stat <- weightedStats(DataUse)

                    # Combine weighted survey summary statistics and aggregate group counts
                    combinedStats <- function (stat){
                    basicsummary <- psych::describeBy(get(biomarkerField,DataUse),
                                                      get(aggregationField,DataUse),
                                                      mat = TRUE, digits = 2) %>% srvyr::select(group1, n)
                    combined <- dplyr::left_join(stat, basicsummary, by = c("aggregation" = "group1"))
                    combined <- dplyr::select(combined,aggregation, mean,
                                                   median, standardDeviation,
                                                   lowerQuartile, upperQuartile,
                                                   upperOutlier, lowerOutlier, n)
                    rownames(combined) <- NULL
                    return(combined)
                    }

                    combined <- combinedStats(stat)

                    # Filter out upper and lower outliers
                    filterOutliers <- function(stat, DataUse){
                    data_with_stats <- dplyr::left_join(stat, DataUse, by = c("aggregation" = aggregationField))
                    outliers <- data_with_stats %>%
                            srvyr::rename("measurement" = all_of(biomarkerField)) %>%
                            srvyr::filter(measurement < lowerOutlier | measurement > upperOutlier) %>%
                            srvyr::select(measurement, aggregation)
                    return(outliers)
                    }
                    outliers <- filterOutliers(stat, DataUse)

                    # Output all results
                    output <- list(
                            "totalStats" = summary,
                            "aggregatedStats" = combined,
                            "aggregatedOutliers" = outliers,
                            "aggregatedThresholds" = thresh
                    )
                    return(output)

}

