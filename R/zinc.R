#' Biomarker Data
#'
#' Does some stuff
#'
#' @param theData the data
#' @param groupId the group
#' @param biomarkerName the biomarker
#' @param thresholds the thresholds
#'
#' @return output
#' @export
#'
#' @examples
BiomarkerData <- function(theData, groupId, biomarkerName, thresholds) {

  print(theData)

  #### Bring in data ####
  MyGp<-groupId  # change this to change the demographic group data used
  MyMN<-10 # column for the biomarker data
  MyAgg<-2 # this is the aggregate data field to be used
  DataUse<-theData # this is the participant and biomarker data

  #Make sure the biomarker column values are numeric
  DataUse[,MyMN] = as.numeric(as.character(DataUse[,MyMN]))

  #PhysLimits<-read.csv() # this is a table with physiological limit for each MN
  PhysLim<-300 # fixed figure until a csv to import

  #### Flags to accomodate differences between surveys
  Flag_SurvWeightRun<-1 # where 1 = 'run' as not adjusted in the supplied data and 0 = 'do not run' as already adjusted
  Flag_SurvWeightSUpplied<-1 # where not supplied set to 0, supplied = 1. Run if above = 1.
  Flag_HaemAltAdjust<-0  # Adjustment not run (0) where already adjusted in the supplied data, run if = 1.
  Flag_SmokeAdjust<-0 # Adjustment not run (0) where already adjusted in the supplied data, or smoking not recorded so cannot adjust

  print('Start!')

}


