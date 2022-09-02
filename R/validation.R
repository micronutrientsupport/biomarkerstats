#' @title Validation
#'
#' @description
#' Validates input files and parameters for the SummaryStats function
#'
#' @details
#' This function can be used to evaluate the input files ('theData' and
#' 'thresholds') are complete and in the correct format.
#' It also checks the function paramaters (biomarkerField, aggregationField
#' and groupId) have been called correctly and match the input data.
#'
#' If there is no error returned the parameters and datasets are correct, and
#' you may proceed with using the SummaryStats function.
#'
#' @param theData the data
#' @param groupId the group
#' @param biomarkerField the field name of the biomarker measurement data
#' must be labelled "zinc", "haemoglobin", "ferritin", "stfr", "rbp", "retinol"
# "rbcFolate", "psFolate", "vitaminB12", "zinc", "crp", "agp", "iodine". Else
#' data will not be read.
#'
#' @param aggregationField the field name to aggregate by
#' @param thresholds the thresholds
#'
#' @export
#' @return

validation <- function (theData,
                       biomarkerField,
                       aggregationField,
                       groupId,
                       thresholds){

        if (is.null(theData) || nrow(theData) == 0) {
                stop("the input dataset is empty")
        }

        if (!(biomarkerField %in% names(theData))) {
                stop("theData does not contain biomarkerField: '",
                     biomarkerField, "'")
        }

        if (!(aggregationField %in% names(theData))) {
                stop("theData does not contain aggregationField: '",
                     aggregationField, "'")
        }

        if (!(names(table(theData$groupId)) == groupId)) {
                stop("the groupId column in theData is either not present, ",
                     " or non-homogenous. Please check for mixed groups in your groupId")
        }

        # Check there are more than 2 data points for each aggregate group
        preprocessData <- function (DataUse){
          DataUse[,"surveyStrata"][is.na(DataUse[, "surveyStrata"])] <- 0
          DataUse[,c("surveyStrata","surveyWeights")] <- lapply(DataUse[, c("surveyStrata","surveyWeights")], as.integer)
          DataUse[, biomarkerField] <- as.numeric(DataUse[, biomarkerField])
          biomarkers <- c("agp", "crp", "ferritin",
                          "haemoglobin", "iodine", "psFolate",
                          "rbcFolate", "rbp", "retinol",
                          "stfr", "vitaminB12", "zinc")
          for(i in seq(biomarkers)){
            if (biomarkers[i] %in% names(DataUse)){
              DataUse[, biomarkers[i]] <- as.numeric(DataUse
                                                     [, biomarkers[i]])
            }
          }
          DataUse[, aggregationField] <- as.character(DataUse[, aggregationField])
          DataUse <- DataUse[complete.cases(DataUse[biomarkerField]), ]
          DataUse <- DataUse[complete.cases(DataUse[aggregationField]), ]
          DataUse <- DataUse[DataUse[,"groupId"] == groupId, ]
          DataUse[, "isPregnant"] <- as.logical(DataUse[, "isPregnant"])
          DataUse <- DataUse[is.na(DataUse["isPregnant"])|DataUse["isPregnant"]== FALSE,]
          # Select values that are under the physiological limit for micronutrients
          PhysLim <- 6000
          DataUse <- DataUse[which(get(biomarkerField, DataUse) <= PhysLim), ]
          return(DataUse)
        }
        DataUse <- preprocessData(theData)

        if (0 %in% DataUse[,biomarkerField]) {
                message("There is at least one 0 value observed for ", biomarkerField,
                        ". All 0 values will be changed to 0.001 in order to
                        invoke the Summarystats function")
        }

        if (sum((DataUse[[biomarkerField]] < 0), na.rm = TRUE) > 0) {
                message("There are negative values found for ", biomarkerField,
                        ". Any rows containing negative values for this
                        biomarker will be removed")
        }

        zeroNegative <- function (DataUse){
                DataUse[,biomarkerField] <- ifelse(DataUse[,biomarkerField] == 0,
                                                   0.001,
                                                   DataUse[,biomarkerField])
                DataUse <- subset(DataUse, get(biomarkerField) > 0)
                return(DataUse)
        }
        DataUse <- zeroNegative(DataUse)

        if (length(Filter(function(x) x <2, with(DataUse, table(get(aggregationField))))) > 0) {
                stop("the number of observations in the aggregate group is less than 2")
        }

        # Check the thresholds list; expected to be empty for agp, crp, stfr

        if (biomarkerField %in% c("agp", "crp", "stfr")){
                invisible()
        } else {
                if (toString(names(thresholds)) == "") {
                        stop("thresholds values have not been provided")
                }

                if (typeof(thresholds) != "list") {
                        stop("thresholds must be a list")
                }

                for(i in seq(names(thresholds))){
                        if (!("lower" %in% names(thresholds[[i]]))) {
                                stop("lower bound for '", names(thresholds[i]),
                                     "' threshold is missing or has been mislabelled")
                        }
                }

                for(i in seq(names(thresholds))){
                        if (!("upper" %in% names(thresholds[[i]]))) {
                                stop("upper bound for '", names(thresholds[i]),
                                     "' threshold is missing or has been mislabelled")
                        }
                }
        }
}

### TODO: Add line which checks for biomarker field names ######
c("agp", "crp", "ferritin", "haemoglobin", "iodine", "psFolate", "rbcFolate",
  "rbp", "retinol", "stfr", "vitaminB12", "zinc")
