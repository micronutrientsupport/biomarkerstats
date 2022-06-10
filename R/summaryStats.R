#' Biomarker Data
#'
#' Computes summary statistics for National Micronutrient Surveys.
#'
#' @param theData the data
#'
#' @param groupId the group
#'
#' @param biomarkerField the field name of the biomarker measurement data.
#' When a zero value is observed in the biomarkerField, there is a nominal value
#' of 0.001 added to the zero value in order to #' facilitate statistical
#' computation (in particular Log transform in the BRINDA package)
#'
#' @param aggregationField the field name to aggregate by
#'
#' @param thresholds the thresholds
#'
#' @param Flag_SurvWeightRun If survey weights have already been run (?) set
#' Flag_SurvWeightRun = TRUE, else default is FALSE and the survey weights will
#' be run
#'
#' @param Flag_SurvWeightSupplied If survey weights have already been supplied (?) set
#' Flag_SurvWeightupplied = TRUE, else default is FALSE
#'
#' @param Flag_HaemAltAdjust If Haemogoblin adjustment for altitude has already
#' been applied set Flag_HaemAltAdjust = TRUE, else default is FALSE and the
#' Haemoglobin will be adjusted
#'
#' @param Flag_SmokeAdjust If Haemogoblin adjustment for smoking status has already
#' been applied set Flag_HaemAltAdjust = TRUE, else default is FALSE and the
#' Haemoglobin will be adjusted
#'
#' @references
#' \itemize{
#' \item{}{Luo, H.; Addo, Y.; Jahan, A (2021) BRINDA: Computation of BRINDA
#' Adjusted Micronutrient Biomarkers for Inflammation.
#' R package version 0.1.2, https://github.com/hanqiluo/BRINDA}
#' \item{}{International Zinc Nutrition Consultative Group
#' (IZiNCG). Assessing Population Zinc Status with
#' Serum Zinc Concentration. IZiNCG Technical Brief
#' No. 2. 2nd ed. Davis, CA: University of California;
#' 2012. www.izincg.org}
#' }
#'
#' @importFrom magrittr %>%
#'
#' @import srvyr jtools survey dplyr BRINDA
#'
#' @return output
#'
#' @export

# Function definitions (as used in main function)

preprocessData <- function(theData,biomarkerField,
                           aggregationField,
                           groupId){
  theData[,"surveyStrata"][is.na(theData[, "surveyStrata"])] <- 0
  theData[,c("surveyStrata","surveyWeights")] <- lapply(theData[, c("surveyStrata","surveyWeights")], as.integer)
  theData[, biomarkerField] <- as.numeric(theData[, biomarkerField])
  biomarkers <- c("agp", "crp", "ferritin",
                  "haemoglobin", "iodine", "psFolate",
                  "rbcFolate", "rbp", "retinol",
                  "stfr", "vitaminB12", "zinc")
  for(i in seq(biomarkers)){
    if (biomarkers[i] %in% names(theData)){
      theData[, biomarkers[i]] <- as.numeric(theData
                                             [, biomarkers[i]])
    }
  }
  theData[, aggregationField] <- as.character(theData[, aggregationField])
  theData <- theData[complete.cases(theData[biomarkerField]), ]
  theData <- theData[complete.cases(theData[aggregationField]), ]
  theData <- theData[theData[,"groupId"] == groupId, ]
  theData[, "isPregnant"] <- as.logical(theData[, "isPregnant"])
  theData <- theData[is.na(theData["isPregnant"])|theData["isPregnant"]== FALSE,]
  # Select values that are under the physiological limit for micronutrients
  PhysLim <- 6000
  theData <- theData[which(get(biomarkerField, theData) <= PhysLim), ]
  return(theData)
}

zeroNegative <- function(processed_data, biomarkerField){
  processed_data[,biomarkerField] <- ifelse(processed_data[,biomarkerField] == 0,
                                            0.001,
                                            processed_data[,biomarkerField])
  processed_data <- subset(processed_data, get(biomarkerField) > 0)
  return(processed_data)
}

applyBrinda <- function(survey_data, biomarkerField, groupId){

  if(biomarkerField %in% c("rbp", "retinol", "ferritin",
                           "stfr", "zinc")) {

    brinda <- "BRINDA(dataset = survey_data,"

    if (biomarkerField == 'rbp'){
      biomarker <- "retinol_binding_protein_varname = rbp,"
    } else if (biomarkerField == 'retinol') {
      biomarker <- "retinol_varname = retinol,"
    } else if (biomarkerField == 'ferritin') {
      biomarker <- "ferritin_varname = ferritin,"
    } else if (biomarkerField == 'stfr') {
      biomarker <- "soluble_transferrin_receptor_varname = stfr,"
    } else if (biomarkerField == 'zinc') {
      biomarker <- "zinc_varname = zinc,"
    }

    agp <- ifelse ("agp" %in% names(survey_data),
                   "agp_varname = agp,", "agp_varname = ,")

    crp <- ifelse ("crp" %in% names(survey_data),
                   "crp_varname = crp,", "crp_varname = ,")

    if (groupId == "WRA"){
      pop <-"population = WRA)"
    } else if (groupId == "PSC"){
      pop <- "population = PSC)"
    } else if (groupId == "SAC" || groupId == "MEN"){
      pop <- "population = OTHER)"
    }
    return(eval(parse(text=paste(brinda,
                                 biomarker,
                                 agp,crp,pop))))

  } else {
    invisible()
  }
}

useAdjusted <- function(brinda_data, biomarkerField) {
  brinda_data[, "original_biomarkerField"] <- brinda_data[, biomarkerField]
  brinda_data[, biomarkerField]<- ifelse(biomarkerField == "rbp", brinda_data["rbp_adj"],
                                         ifelse(biomarkerField == "retinol", brinda_data["sr_adj"],
                                                ifelse(biomarkerField == "ferritin", brinda_data["sf_adj"],
                                                       ifelse(biomarkerField == "stfr", brinda_data["stfr_adj"],
                                                              ifelse(biomarkerField == "zinc", brinda_data["zn_adj"],
                                                                     brinda_data[biomarkerField])
                                                       )
                                                )
                                         )
  )
  return(brinda_data)
}

# zincAdjusted <- function(survey_data, biomarkerField) {}

# haemAdjusted <- function(survey_data, biomarkerField)

ageCategories <- function(survey_data){
  id <- survey_data[,"groupId"]
  age <-survey_data[,"ageInMonths"]
  y <- 12
  survey_data[,"AgeCat"] <- ifelse(id == "WRA",
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
  survey_data <- survey_data[complete.cases(survey_data["AgeCat"]),]
  survey_data[,"DemoGpCat"] <- paste0(id, ".", survey_data[,"AgeCat"])
  return(survey_data)
}

calcThresholds <- function(survey_data, biomarkerField, thresholds){
  thresh <- list()
  for (thresholdName in names(thresholds)) {
    lower <- as.numeric(thresholds[[thresholdName]]$lower)
    upper <- as.numeric(thresholds[[thresholdName]]$upper)
    if (lower == 0) {
      # assign deficiency thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] <= upper, TRUE, FALSE)
    } else if (length(upper)==0) {
      # assign excess thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower, TRUE, FALSE)
    } else {
      # assign thresholds between two values
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower & survey_data[, biomarkerField] <= upper, TRUE, FALSE)
    }
  }
  return(survey_data)
}

createDHS <- function(survey_data, Flag_SurvWeightRun, Flag_SurvWeightSupplied){
  # Create a Demographic and Health Survey (DHS)
  if (Flag_SurvWeightRun == TRUE & Flag_SurvWeightSupplied == TRUE) {
    DHSdesign <- survey::svydesign(id = survey_data[,"surveyCluster"], strata = survey_data[,"surveyStrata"], weights = survey_data[,"surveyWeights"] / 1000000, data = survey_data, nest = TRUE)
    options("survey.lonely.psu" = "adjust")
  } else {
    DHSdesign <- survey::svydesign(ids = ~1, strata = NULL, weights = NULL, data = survey_data)
  }
  return(DHSdesign)
}

summaryDHS <- function(survey_data, DHSdesign, biomarkerField) {
  # compute statistics for DHS
  mean <- survey::svymean( ~ survey_data[, biomarkerField], DHSdesign, ci = FALSE)
  quantiles <- survey::oldsvyquantile( ~ survey_data[, biomarkerField],
                                       DHSdesign, c(.25, .5, .75),
                                       ci = FALSE)
  sd <- jtools::svysd( ~ survey_data[, biomarkerField], DHSdesign)
  n <- nrow(survey_data)
  summary <- as.data.frame(cbind(mean, quantiles, sd, n))
  summary <- srvyr::rename(
    summary,
    lowerQuartile = "0.25",
    median = "0.5",
    upperQuartile = "0.75",
    standardDeviation = "sd"
  )
  lowerQuartile <- summary[, "lowerQuartile"]
  upperQuartile <- summary[, "upperQuartile"]
  summary <- summary %>%
    srvyr::mutate(IQR = upperQuartile - lowerQuartile) %>%
    srvyr::mutate(upperOutlier = upperQuartile + 1.5 * IQR,
                  lowerOutlier = lowerQuartile - 1.5 * IQR) %>%
    srvyr::select(
      mean,
      median,
      standardDeviation,
      lowerQuartile,
      upperQuartile,
      upperOutlier,
      lowerOutlier,
      n
    )
  rownames(summary) <- NULL
  return(summary)
}

calcDeficiency <- function(survey_data, thresholds, aggregationField, DHSdesign) {
  thresh <- list()
  for (thresholdName in names(thresholds)) {
    thresh[[thresholdName]] <- survey::svyby(as.formula(paste("~", thresholdName)), ~ survey_data[, aggregationField], DHSdesign, survey::svyciprop, vartype = "ci")
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "survey_data[, aggregationField]"] <- "aggregation"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "deficiency"] <- "percentage"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_l"] <- "confidenceIntervalLower"
    names(thresh[[thresholdName]])[names(thresh[[thresholdName]]) == "ci_u"] <- "confidenceIntervalUpper"
    rownames(thresh[[thresholdName]]) <- NULL
  }
  return(thresh)
}

weightedStats <- function(survey_data, biomarkerField, aggregationField,
                           surveyCluster, surveyStrata, surveyWeights){
  options("survey.lonely.psu" = "adjust")
  strat_design_srvyr <- survey_data %>%
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

combinedStats <- function(survey_data, biomarkerField, aggregationField, stat){
  basicsummary <- psych::describeBy(get(biomarkerField, survey_data),
                                    get(aggregationField, survey_data),
                                    mat = TRUE, digits = 2) %>% srvyr::select(group1, n)
  combined <- dplyr::left_join(stat, basicsummary, by = c("aggregation" = "group1"))
  combined <- dplyr::select(combined,aggregation, mean,
                            median, standardDeviation,
                            lowerQuartile, upperQuartile,
                            upperOutlier, lowerOutlier, n)
  rownames(combined) <- NULL
  return(combined)
}

filterOutliers <- function(survey_data, stat, biomarkerField, aggregationField){
  data_with_stats <- dplyr::left_join(stat, survey_data, by = c("aggregation" = aggregationField))
  outliers <- data_with_stats %>%
    srvyr::rename("measurement" = all_of(biomarkerField)) %>%
    srvyr::filter(measurement < lowerOutlier | measurement > upperOutlier) %>%
    srvyr::select(measurement, aggregation)
  return(outliers)
}

# Main SummaryStats function
SummaryStats <- function(theData,
                         biomarkerField,
                         aggregationField,
                         groupId,
                         thresholds,
                         Flag_SurvWeightRun = TRUE,
                         Flag_SurvWeightSupplied = TRUE,
                         Flag_HaemAltAdjust = FALSE,
                         Flag_SmokeAdjust = FALSE) {

  survey_data <- preprocessData(theData, biomarkerField,
                                aggregationField, groupId)

  survey_data <- zeroNegative(survey_data, biomarkerField)

  # brinda_data <- applyBrinda(survey_data, biomarkerField)

  # survey_data <- useAdjusted(brinda_data, biomarkerField)

  # zinc adjustments

  # zinc_adj_data <- zincAdjusted(brinda_adj_data)

  # haemoglobin altitide adjustment (if statement: Flag_HaemAltAdjust = FALSE)

  # haem_alt_adj_data <- haemAltAdjusted(zinc_adjusted_data)

  # haemoglobin smoking adjustment (if statement: Flag_SmokeAdjust = FALSE)

  # haem_smoke_adj_data <- haemSmokeAdjusted(zinc_adjusted_data)

  survey_data <- ageCategories(survey_data)

  survey_data <- calcThresholds(survey_data, thresholds = thresholds, biomarkerField)

  DHSdesign <- createDHS(survey_data, Flag_SurvWeightRun, Flag_SurvWeightSupplied)

  summary <- summaryDHS(survey_data, DHSdesign, biomarkerField)

  # Calculate deficiency percentages for all threshold levels

  thresh <- calcDeficiency(survey_data, thresholds, aggregationField, DHSdesign)

  # Calculate weighted survey summary statistics

  stat <- weightedStats(survey_data, biomarkerField, aggregationField,
                        surveyCluster, surveyStrata, surveyWeights)

  # Combine weighted survey summary statistics and aggregate group counts

  combined <- combinedStats(survey_data, biomarkerField, aggregationField, stat)

  # Filter out upper and lower outliers

  outliers <- filterOutliers(survey_data, stat, biomarkerField, aggregationField)

  # Output all results
  output <- list(
    "totalStats" = summary,
    "aggregatedStats" = combined,
    "aggregatedOutliers" = outliers,
    "aggregatedThresholds" = thresh
  )
  return(output)
}


