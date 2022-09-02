#' @name SummaryStats
#'
#' @title Computes summary statistics for National Micronutrient Surveys
#'
#' @param theData Micronutrient survey data
#'
#' @param group_id group id of interest: WRA, PSC, SAC, MEN
#'
#' @param biomarkerField the field name of the biomarker measurement data.
#' When a zero value is observed in the biomarkerField, there is a nominal value
#' of 0.001 added to the zero value in order to #' facilitate statistical
#' computation (in particular Log transform in the BRINDA package)
#'
#' @param aggregationField the field name to aggregate by
#'
#' @param thresholds the biomarker threshold input to determine the level of
#' deficiency or excess for an individual
#'
#' @param RunSurveyWeights By default this analysis takes into account
#' the survey weights (must be supplied). Otherwise, set RunSurveyWeights = FALSE
#' to set run the analysis without survey weights.
#'
#' @param HaemAltAdjust Haemoglobin will be adjusted for altitude.
#' The default argument is set to TRUE, if you would not like to apply this
#' adjustment set HaemAltAdjust = FALSE
#'
#' @param HaemSmokeAdjust Haemoglobin will be adjusted for smoking status.
#' This function assumes the amount of cigarettes per day is not known
#' and assesses only if the individual is a smoker or not. The default argument
#' is set to TRUE, if you would not like to apply this adjustment set
#' HaemSmokeAdjust = FALSE
#'
#' @param ZincCutoff The zinc cutoff concentrations will be based on age, sex,
#' time of day and fasting status. The default argument is set to TRUE,
#' if you would not like to apply this adjustment set ZincCutoff = FALSE
#'
#' @details The default threshold level for deficiency used for STFR is 8.3(mg/l)
#' for all age groups. Users should confirm the threshold according to
#' manufacturer's suggested values.
#'
#' @references
#' \itemize{
#' \item{}{Luo, H.; Addo, Y.; Jahan, A (2021) BRINDA: Computation of BRINDA
#' Adjusted Micronutrient Biomarkers for Inflammation. R package version 0.1.2,
#' https://github.com/hanqiluo/BRINDA}
#' \item{}{International Zinc Nutrition Consultative Group
#' (IZiNCG). Assessing Population Zinc Status with #' Serum Zinc Concentration.
#' IZiNCG Technical Brief No. 2. 2nd ed. Davis, CA: University of California;
#' 2012. www.izincg.org}
#' \item{}{Sullivan, K. M., Mei, Z., Grummer-Strawn, L., & Parvanta, I. (2008).
#' Haemoglobin adjustments to define anaemia. Tropical Medicine & International
#' Health, 13(10), 1267-1271.}
#' \item{}{Allen LH, Miller JW, de Groot L, Rosenberg IH, Smith AD, Refsum H,
#' Raiten DJ. Biomarkers of Nutrition for Development (BOND): Vitamin B-12
#' Review. J Nutr. 2018 Dec 1;148(suppl_4):1995S-2027S.}
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

preprocessData <- function(survey_data, biomarkerField,
                           aggregationField,
                           group_id){
  survey_data[,"survey_strata"][is.na(survey_data[, "survey_strata"])] <- 0
  survey_data[,"survey_strata"] <- as.numeric(survey_data[,"survey_strata"])
  survey_data[,"survey_weight"] <- as.numeric(survey_data[,"survey_weight"])
  survey_data[, biomarkerField] <- as.numeric(survey_data[, biomarkerField])
  biomarkers <- c("agp", "crp", "ferritin",
                  "haemoglobin", "iodine", "ps_folate",
                  "rbc_folate", "rbp", "retinol",
                  "stfr", "vitamin_b12", "zinc")
  for(i in seq(biomarkers)){
    if (biomarkers[i] %in% names(survey_data)){
      survey_data[, biomarkers[i]] <- as.numeric(survey_data
                                             [, biomarkers[i]])
    }
  }
  survey_data[, aggregationField] <- as.character(survey_data[, aggregationField])
  survey_data <- survey_data[complete.cases(survey_data[biomarkerField]), ]
  survey_data <- survey_data[complete.cases(survey_data[aggregationField]), ]
  survey_data <- survey_data[survey_data[,"group_id"] == group_id, ]
  # Assumption pregnant women have been removed from dataset
  # Select values that are under the physiological limit for micronutrients
  PhysLim <- 6000
  survey_data <- survey_data[which(get(biomarkerField, survey_data) <= PhysLim), ]
  return(survey_data)
}

zeroNegative <- function(processed_data, biomarkerField){
  processed_data[,biomarkerField] <- ifelse(processed_data[,biomarkerField] == 0,
                                            0.001,
                                            processed_data[,biomarkerField])
  processed_data <- subset(processed_data, get(biomarkerField) > 0)
  return(processed_data)
}

applyBrinda <- function(survey_data, biomarkerField, group_id, brinda_biomarkers){

  if(biomarkerField %in%  brinda_biomarkers) {

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

    if (group_id == "WRA"){
      pop <-"population = WRA)"
    } else if (group_id == "PSC"){
      pop <- "population = PSC)"
    } else if (group_id == "SAC" || group_id == "MEN"){
      pop <- "population = OTHER)"
    }
    return(eval(parse(text=paste(brinda,
                                 biomarker,
                                 agp,crp,pop))))

  } else {
    invisible()
  }
}

useAdjusted <- function(survey_data, biomarkerField, brinda_biomarkers) {
  if(biomarkerField %in%  brinda_biomarkers){

  survey_data[, "original_biomarkerField"] <- survey_data[, biomarkerField]
  survey_data[, biomarkerField]<- ifelse(biomarkerField == "rbp", survey_data["rbp_adj"],
                                         ifelse(biomarkerField == "retinol", survey_data["sr_adj"],
                                                ifelse(biomarkerField == "ferritin", survey_data["sf_adj"],
                                                       ifelse(biomarkerField == "stfr", survey_data["stfr_adj"],
                                                              ifelse(biomarkerField == "zinc", survey_data["zn_adj"],
                                                                     survey_data[biomarkerField])
                                                       )
                                                )
                                         )
  )
  }
  return(survey_data)
}

zincCutoff <- function(survey_data, biomarkerField, thresholds){
  for (thresholdName in names(thresholds)) {
    lower <- as.numeric(thresholds[[thresholdName]]$lower)
    upper <- as.numeric(thresholds[[thresholdName]]$upper)
    cond <- survey_data$time_of_day_sampled == thresholds[[thresholdName]]$condition$time_of_day_sampled &
      survey_data$was_fasting == thresholds[[thresholdName]]$condition$was_fasting &
      survey_data$sex == thresholds[[thresholdName]]$condition$sex &
      if (thresholds[[thresholdName]]$condition$age_less_greater == "<"){
        survey_data$age_in_months < thresholds[[thresholdName]]$condition$age_in_months
      } else if (thresholds[[thresholdName]]$condition$age_less_greater == ">="){
        survey_data$age_in_months >= thresholds[[thresholdName]]$condition$age_in_months
      }

    if (lower == 0) {
      # assign deficiency thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] <= upper & cond , TRUE, FALSE)
    } else if (length(upper) == 0) {
      # assign excess thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower & cond , TRUE, FALSE)
    } else if (upper !=0 & lower !=0) {
      # assign thresholds between two values
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower & survey_data[, biomarkerField] <= upper & cond , TRUE, FALSE)
    } else {
      survey_data[[thresholdName]] <- FALSE
    }
  }
  return(survey_data)
}

haemAltAdjust <- function(survey_data, thresholds, biomarkerField){
  survey_data[, "haemoglobin"] <-
    ifelse(survey_data[,"altitude_in_metres"] >= 1000,
           survey_data[, "haemoglobin"] - (-0.032*(survey_data[,"altitude_in_metres"]*0.0032808)
                                           + (0.022*(survey_data[,"altitude_in_metres"]*0.0032808)^2)),
           survey_data[, "haemoglobin"]
    )
  return(survey_data)
}

haemSmokeAdjust <- function(survey_data, thresholds, biomarkerField){
  survey_data[, "haemoglobin"] <-
    ifelse(survey_data[,"is_smoker"] == TRUE,
           survey_data[,"haemoglobin"] - 0.3,
           survey_data[,"haemoglobin"]
    )
  return(survey_data)
}

vitaminb12Cutoff <- function(survey_data, biomarkerField, thresholds){
  for (thresholdName in names(thresholds)) {
    lower <- as.numeric(thresholds[[thresholdName]]$lower)
    upper <- as.numeric(thresholds[[thresholdName]]$upper)
    cond <- survey_data$age_in_months >= thresholds[[thresholdName]]$condition$lower_age_in_months &
      survey_data$age_in_months < thresholds[[thresholdName]]$condition$upper_age_in_months

    if (lower == 0) {
      # assign deficiency thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] <= upper & cond , TRUE, FALSE)
    } else if (length(upper) == 0) {
      # assign excess thresholds
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower & cond , TRUE, FALSE)
    } else if (upper !=0 & lower !=0) {
      # assign thresholds between two values
      survey_data[[thresholdName]] <- ifelse(survey_data[, biomarkerField] > lower & survey_data[, biomarkerField] <= upper & cond , TRUE, FALSE)
    } else {
      survey_data[[thresholdName]] <- FALSE
    }
  }
  return(survey_data)
}

ageCategories <- function(survey_data){
  id <- survey_data[,"group_id"]
  age <-survey_data[,"age_in_months"]
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

createDHS <- function(survey_data, RunSurveyWeights){
  # Create a Demographic and Health Survey (DHS)
  if (RunSurveyWeights == TRUE) {
    DHSdesign <- survey::svydesign(id = survey_data[,"survey_cluster"], strata = survey_data[,"survey_strata"], weights = survey_data[,"survey_weight"] / 1000000, data = survey_data, nest = TRUE)
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
                           survey_cluster, survey_strata, survey_weight){
  options("survey.lonely.psu" = "adjust")
  strat_design_srvyr <- survey_data %>%
    srvyr::rename("aggregation" = all_of(aggregationField)) %>%
    srvyr::rename("biomarker" = all_of(biomarkerField)) %>%
    srvyr::mutate(aggregation = as.factor(aggregation)) %>%
    srvyr::mutate(biomarker = as.numeric(biomarker)) %>%
    srvyr::as_survey_design(id = survey_cluster,
                            strata = survey_strata,
                            weights = survey_weight,
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
                         group_id,
                         thresholds,
                         RunSurveyWeights = TRUE,
                         Brinda = TRUE,
                         HaemAltAdjust = TRUE,
                         HaemSmokeAdjust = TRUE,
                         ZincCutoff = TRUE, ...) {

  survey_data <- preprocessData(theData, biomarkerField,
                                aggregationField, group_id)

  survey_data <- zeroNegative(survey_data, biomarkerField)

  brinda_biomarkers <- c("rbp", "retinol", "ferritin",
                         "stfr", "zinc")

  if (Brinda == TRUE & biomarkerField %in% brinda_biomarkers){
  survey_data <- applyBrinda(survey_data, biomarkerField, group_id, brinda_biomarkers)
  survey_data <- useAdjusted(survey_data, biomarkerField, brinda_biomarkers)
  }

  # Adjust cutoffs for zinc, haemoglobin and vitamin b12
  if (biomarkerField == "zinc" & ZincCutoff == TRUE){
    survey_data <- zincCutoff(survey_data, thresholds = thresholds, biomarkerField)
  }
  if (biomarkerField == "haemoglobin" && HaemAltAdjust == TRUE){
    survey_data <- haemAltAdjust(survey_data,  thresholds = thresholds, biomarkerField)
  }
  if (biomarkerField == "haemoglobin" && HaemSmokeAdjust == TRUE && "is_smoker" %in% colnames(survey_data)){
    survey_data <- haemSmokeAdjust(survey_data, thresholds = thresholds,  biomarkerField)
  }
  # Smoking status is not typically recorded with SAC / PSC
  if (biomarkerField == "haemoglobin" && HaemSmokeAdjust == TRUE && !("is_smoker" %in% colnames(survey_data))){
    stop("Smoking status (is_smoker), has not been recorded")
  }
  # Cut off for PSC based on age < 24 months old
  if (biomarkerField == "vitamin_b12" && group_id == "PSC"){
    survey_data <- vitaminb12Cutoff(survey_data, thresholds = thresholds, biomarkerField)
  } else {
    survey_data <- calcThresholds(survey_data, thresholds = thresholds, biomarkerField)
  }

  # No AgeCat variable in export dataset
  # survey_data <- ageCategories(survey_data)

  DHSdesign <- createDHS(survey_data, RunSurveyWeights)

  summary <- summaryDHS(survey_data, DHSdesign, biomarkerField)

  # Calculate deficiency percentages for all threshold levels

  thresh <- calcDeficiency(survey_data, thresholds, aggregationField, DHSdesign)

  # Calculate weighted survey summary statistics

  stat <- weightedStats(survey_data, biomarkerField, aggregationField,
                        survey_cluster, survey_strata, survey_weight)

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

