#' Biomarker Data
#'
#' Does some stuff
#'
#' @param theData the data
#' @param groupId the group
#' @param biomarkerName the biomarker
#' @param thresholds the thresholds
#'
#' @importFrom magrittr %>%
#'
#' @return output
#' @export
#'
#' @examples
SummaryStats <- function(theData, biomarkerName, groupId, thresholds) {

  #### Bring in data ####
  MyGp<-groupId  # change this to change the demographic group data used
  MyMN<-10 # column for the biomarker data
  MyAgg<-2 # this is the aggregate data field to be used
  DataUse<-theData # this is the participant and biomarker data

  #Make sure the biomarker column values are numeric
  #DataUse[,MyMN] = as.numeric(as.character(DataUse[,MyMN]))

  #PhysLimits<-read.csv() # this is a table with physiological limit for each MN
  PhysLim<-6000 # fixed figure until a csv to import

  #### Flags to accomodate differences between surveys
  Flag_SurvWeightRun<-0 # where 1 = 'run' as not adjusted in the supplied data and 0 = 'do not run' as already adjusted
  Flag_SurvWeightSUpplied<-0 # where not supplied set to 0, supplied = 1. Run if above = 1.
  Flag_HaemAltAdjust<-0  # Adjustment not run (0) where already adjusted in the supplied data, run if = 1.
  Flag_SmokeAdjust<-0 # Adjustment not run (0) where already adjusted in the supplied data, or smoking not recorded so cannot adjust

  #### Eligible data selection ####
  #DataUse[,MyMN] = as.numeric(as.character(DataUse[,MyMN])) #Make sure the biomarker column values are numeric
  DataUse[,MyMN] = as.numeric(unlist(DataUse[,MyMN]))


  DataUse <- DataUse[!(is.na(DataUse[,MyMN])),] #omit row with NA in the col of interest
  DataUse <- DataUse[!(is.na(DataUse[,MyAgg])),] #omit row with NA in the aggregation column
  DataUse <- DataUse[!(is.null(DataUse[,MyAgg])),]


  DataUse<-DataUse[which(DataUse[,MyMN]<=PhysLim),]   #Excluding physiological implausible concentrations for the specific MN


  # assign age categories, then exclude the '0' rows
  DataUse$AgeCat<-ifelse(DataUse$groupId=="WRA",
                         ifelse(DataUse$ageInMonths>=(15*12) & DataUse$ageInMonths<(20*12),1,ifelse(DataUse$ageInMonths>=(20*12) & DataUse$ageInMonths<(50*12),2,0)),
                         ifelse(DataUse$groupId=="PSC",
                                ifelse(DataUse$ageInMonths>=(0.5*12) & DataUse$ageInMonths<(2*12),1,ifelse(DataUse$ageInMonths>=(2*12) & DataUse$ageInMonths <(5*12),2,0)),
                                ifelse(DataUse$groupId=="SAC",
                                       ifelse(DataUse$ageInMonths>=(5*12) & DataUse$ageInMonths<(11*12),1,ifelse(DataUse$ageInMonths>=(12*12) & DataUse$ageInMonths <(15*12),2,0)),
                                       ifelse(DataUse$groupId=="MEN",
                                              ifelse(DataUse$ageInMonths>=(15*12) & DataUse$ageInMonths<(30*12),1,ifelse(DataUse$ageInMonths>=(30*12) & DataUse$ageInMonths <(54*12),2,0)),
                                              0))))

  DataUse<-DataUse[which(DataUse$AgeCat>0),]
  DataUse$DemoGpCat<-paste(DataUse$groupId,".",DataUse$AgeCat)


  DataUse<-DataUse[which(DataUse$isPregnant!=1),]  #exclude pregnant



  #### Adjustments ####

  # E.g. haemoglobin adjustment for altitude

  # E.g. haemoglobin adjustment for smoking


  #### Survey Weights ####
  # Adjust by survey weight where not already done AND weights supplied, *else* run without use weights to get common output format
  #  make sure cluster, strat and weight always have the same name and structure (weight to divide by 1000000)
  if(Flag_SurvWeightRun == 1 & Flag_SurvWeightSUpplied ==1){
    DHSdesign<-survey::svydesign(id=DataUse$cluster, strata=DataUse$strata, weights = DataUse$weights/1000000, data = DataUse, nest = TRUE)
    options("survey.lonely.psu"='adjust')
  } else {
    DHSdesign<-survey::svydesign(ids = ~1, strata=NULL , weights = NULL , data = DataUse)
  }

  #### Calculate weighted survey summary statistics
  options("survey.lonely.psu"='adjust')
  strat_design_srvyr <- DataUse %>%
    srvyr::mutate(regionName = as.factor(regionName)) %>%
    srvyr::mutate(zinc = as.numeric(zinc)) %>%
    srvyr::as_survey_design(id = surveyCluster, strata = surveyStrata, weights = surveyWeights, nest = TRUE)

  stat <- strat_design_srvyr %>%
    srvyr::group_by(regionName) %>%
    srvyr::summarise(
      mean = srvyr::survey_mean(zinc),
      sd = srvyr::survey_sd(zinc),
      Q = srvyr::survey_quantile(zinc, c(0.25, 0.5, 0.75)),
    ) %>%
    srvyr::mutate(IQR = Q_q75 - Q_q25) %>%
    srvyr::mutate(
      out_upp = Q_q75 + 1.5 * IQR,
      out_low = Q_q25 - 1.5 * IQR
    )

  #### Also need N count.  For now calculate using 'base R' and append to the srvyr stats table
  basicSummary <- psych::describeBy(DataUse$zinc,DataUse$regionName,mat = TRUE, digits = 2) %>% srvyr::select(
    group1, n
  )
  combinedStats <- dplyr::left_join(stat, basicSummary, by = c("regionName" = "group1"))

  #### Select the outliers
  dataWithStats <- dplyr::left_join(stat, DataUse, by = "regionName")
  #outliers <- dataWithStats %>% srvyr::select(zinc,out_upp,out_low,regionName) %>% filter(zinc< out_low | zinc>out_upp)
  #print(outliers)

  #### end ####
  return(combinedStats)
}


