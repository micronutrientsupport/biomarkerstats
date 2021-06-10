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

    DHSdesign<-svydesign(id=DataUse$cluster, strata=DataUse$strata, weights = DataUse$weights/1000000, data = DataUse, nest = TRUE)
    options("survey.lonely.psu"='adjust')
  } else {
    DHSdesign<-svydesign(ids = ~1, strata=NULL , weights = NULL , data = DataUse)
  }


  # write boxplot output by admin area # here we can replace zinc by any micronutrient

  svyboxplot(serum_folate~DataUse$regionName, plot=FALSE, DHSdesign)


  ####summary stats#### can we delete the unweighted stats?
  #  all dataset
  Stat1<-data.frame(describe(DataUse[,MyMN]))
  Stat2<-data.frame(t(quantile(DataUse[,MyMN],c(.25, .50, .75),na.rm=TRUE)))
  StatOutputAllData<-cbind(Stat1,Stat2) #not all content needed front end

  # disagg data summary
  Stat3<-describeBy(DataUse[,MyMN],DataUse[,MyAgg],mat = TRUE,digits = 2)
  Stat3<-as.data.frame(Stat3) # most summary stats

  ##weighted summary stats## here we can replace zinc by any micronutrient

  svyquantile(~zinc, design = DHSdesign, quantiles = c(0.25,0.5,0.75))#Quantile for the total sample#

  boxstat1<- as.data.frame(svyby(~zinc, ~regionName, DHSdesign, svyquantile, quantiles=c(0.0,0.25,0.5,0.75,1), keep.var=F))#Quantile by administrative region#

  boxstat2<- as.data.frame(svyby(~zinc, ~AgeCat, DHSdesign, svyquantile, quantiles=c(0.0,0.25,0.5,0.75,1), keep.var=F))#Quantile by different demographic groups#

  DataUse$weights <- DataUse$weights/1000000

  library(srvyr)

  strat_design_srvyr <- DataUse %>% as_survey_design(id = cluster, strata = strata, weights = weights, nest = TRUE)

  strat_design_srvyr %>%
    group_by(regionName) %>%
    summarize(mean = survey_mean(zinc))

  stat <- strat_design_srvyr %>%
    group_by(regionName) %>%
    summarise(
      mean = survey_mean(zinc),
      sd = survey_sd(zinc),
      Q = survey_quantile(zinc, c(0.25, 0.5, 0.75))
    ) %>%
    mutate(IQR = Q_q75 - Q_q25) %>%
    mutate(
      out_upp = Q_q75 + 1.5 * IQR,
      out_low = Q_q25 - 1.5 * IQR
    )

  a <- left_join(stat, DataUse, by = "regionName")

  a %>% select(zinc,out_upp,out_low,regionName) %>% filter(zinc< out_low | zinc>out_upp)

  # Stat4<-as.data.frame(B1$stats) #take quartiles from boxplot B1 outputs
  #Stat4<-Stat4[2:4,]
  # rownames(Stat4)<-c("25th","50th","75th")
  #Stat5<-as.data.frame(t(Stat4))
  # Stat5$group1<-B1$names

  #StatsOutput_agg<-merge(Stat3,Stat5,by = "group1") #not all content needed front end

  #deficiency prevalence


  MyaggZinc<-svyby(~ZINC_DEF, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")

  Myaggfolate<-svyby(~ser_fol_def, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")
  Myaggfolate2<-svyby(~ser_fol_def1, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")
  Myaggfolate3<-svyby(~rbc_fol_def, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")
  Myaggfolate4<-svyby(~rbc_fol_def1, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")
  Myaggfolate5<-svyby(~rbc_fol_def2, ~DataUse$regionName, DHSdesign, svyciprop, vartype="ci")

  Myaggfolate1<-cbind(Myaggfolate,Myaggfolate2,Myaggfolate3, Myaggfolate4, Myaggfolate5)
  Myaggfolate10<-Myaggfolate1[-c(1,5,9,13,17)]
  Myaggfolate100<-Myaggfolate10*100





  #### end ####

  # print(StatsOutput_agg)

  # Return aggregated stats table
  print(StatOutputAllData)
  print(TableZinc)





}


