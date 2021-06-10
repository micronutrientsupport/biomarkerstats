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
BiomarkerData <- function(theData, biomarkerName, groupId, thresholds) {

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
  Flag_SurvWeightRun<-0 # where 1 = 'run' as not adjusted in the supplied data and 0 = 'do not run' as already adjusted
  Flag_SurvWeightSUpplied<-0 # where not supplied set to 0, supplied = 1. Run if above = 1.
  Flag_HaemAltAdjust<-0  # Adjustment not run (0) where already adjusted in the supplied data, run if = 1.
  Flag_SmokeAdjust<-0 # Adjustment not run (0) where already adjusted in the supplied data, or smoking not recorded so cannot adjust


  #### Eligible data selection ####
  DataUse[,MyMN] = as.numeric(as.character(DataUse[,MyMN])) #Make sure the biomarker column values are numeric

  DataUse <- DataUse[!(is.na(DataUse[,MyMN])),] #omit row with NA in the col of interest

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

  DataUse<-DataUse[which(DataUse$isPregnant==0),]  #exclude pregnant

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


  ##weighted summary stats## here we can replace zinc by any micronutrient

  survey::svyquantile(~zinc, design = DHSdesign, quantiles = c(0.25,0.5,0.75))#Quantile for the total sample#

  boxstat1<- as.data.frame(survey::svyby(~zinc, ~regionName, DHSdesign, survey::svyquantile, quantiles=c(0.0,0.25,0.5,0.75,1), keep.var=F))#Quantile by administrative region#
  boxstat2<- as.data.frame(survey::svyby(~zinc, ~AgeCat, DHSdesign, survey::svyquantile, quantiles=c(0.0,0.25,0.5,0.75,1), keep.var=F))#Quantile by different demographic groups#



  #### end ####



  return(boxstat1)


}


