Biomarkerstats'
A function to analyse micronutrient biomarker data

Preface

About this manual
This manual is designed for anyone involved in the analysis of micronutrient biomarkers datasets. The methods were developed by the Micronutrient Action Policy Support (MAPS) project and made available to all for use, without warranty or liability. The MAPS project is funded by the Bill and Melinda Gates Foundation.

Acknowledgements:
Fanny Sandalinas, Tineka Blake, Chris Chagumaira, Andy Bean, Edward Joy, Louise Ander

Who is this manual for 
The goal of this documentation is to help nutritionists and data scientists to analyse datasets more quickly while remaining in full control of the decisions being made, with clear notation of the decisions made at every step. It will help them to better understand the data and obtain accurate estimates of micronutrient status, in a harmonized, reproducible and transparent way.

1.	Introduction
   
Welcome to the training manual on using R and Rstudio for the analysis of micronutrient biomarker data.
The parts on software requirements, data types, data structures, packages and functions can be learnt through this documentation: R for Household Consumption and Expenditure Surveys, as these parts cover the bases of R.

2.	Summary stat function
   
The aim of the function is to create the summary statistics that are needed when analysing micronutrient biomarker data. 
The function can produce summary statistics for serum/plasma: ferritin, soluble transferrin receptors (sTfR), hemoglobin, Retinol Binding Protein (RBP), retinol, zinc, vitamin B9, vitamin B12. 
The SummaryStats function has been broken down into a series of smaller sub-functions.
Each sub-function performs a specific task, i.e. preprocessing, applying a specific adjustment, etc. This has been implemented to make the large body of code more digestable, interpretable and resuable over different source files. 
The SummaryStats function is therefore a series of sub-function calls that can be executed with the default parameters with the following line:
SummaryStats(theData = theData, biomarkerField = biomarkerField, aggregationField = "region", group_id = "WRA", thresholds = thresholds)

2.1	Reporting bugs
Please report any bugs or issue here
2.2	Installation
You can install the function from XXX
2.3	Preparation of the data
To be able to run the function on your data, make sure your data follow exactly the same 
-	name
-	units
-	format
Some of the variables are mandatory:
Biomarker data: at least one biomarker variable should be provided
If zinc data are provided, then fasting information, timing of sample collection and age group for school-age children should be provided to apply the right cutoff to the values.
If vitamin B12 data are provided, exact age of the child in month should be provided so that the right cut-off is used.
Some others are optional:
CRP and AGP: these variables are inflammatory markers and are used to adjust data for inflammation. if they are not present, the BRINDA package will not be applied (see later in 2.3.2) and the summary statistics will be unadjusted.
Weight: if weights were applied during the survey, the original weights must be provided so that the design of the survey is taken into account in summary estimates. 
Survey cluster and survey strata: if the survey was using a complex survey design, then providing the survey cluster and the survey strata will allow the use of a survey package (see 2.3.3) to take into account survey design characteristics in the analysis of data
Aggregation variables. The function allows for some basic aggregation:
Rural/urban
Wealth quintiles
Age group

2.3.1	Import and explore your data
Use the read_dta function from the haven package to import it.

2.3.2	Pre-processing of data
Outliers should be removed manually. We recommend to remove values (changing to NA) following these guidance:
Zinc Data
Remove values of serum/plasma zinc>161 μg/dL
(IZINC technical brief. Adjusting plasma or serum zinc concentrations for inflammation. 2020)
Haemoglobin
haemoglobin<4 g/dL
haemoglobin>18 g/dL
(Sharma AJ, Addo OY, Mei Z, Suchdev PS. Reexamination of hemoglobin adjustments to define anemia: altitude and smoking. Ann N Y Acad Sci. 2019 Aug;1450(1):190-203. doi: 10.1111/nyas.14167. Epub 2019 Jun 23. PMID: 31231812; PMCID: PMC6697572.)

Other biomarkers
There are no publications related to implausible values for the other biomarkers and therefore the approach should be conservative, but removing values that are likely to be resulting from errors in data entry or biologically implausible. 

2.3.3	Population group
The function can work on several population groups of interest: Pre-school children, school-age children, women of reproductive age and men.
Pregnant women should be removed from the dataset. 
It is important to chose the right population of interest as specific cutoff are and the use of inflammation adjustment also depends on the population group that has been chosen.

2.3.4	BRINDA inflammation adjustment

-	Log transformation
In order to calculate the log values of the biomarkers, all values equal to 0 are replaced by a  value of 0.001.
-	AGP or CRP only
The inflammation adjustment can be performed using AGP or CRP only.
For more information related to the inflammation adjustment using the BRINDA package, refer to: Luo H, Geng J, Zeiler M, Nieckula E, Sandalinas F, Williams A, Young MF, Suchdev PS. A Practical Guide to Adjust Micronutrient Biomarkers for Inflammation Using the BRINDA Method. J Nutr. 2023 Apr;153(4):1265-1272. doi: 10.1016/j.tjnut.2023.02.016. Epub 2023 Feb 13. PMID: 36792034; PMCID: PMC10202121.

2.3.5	Survey package
The R survey package is used in the function to be able to take survey characteristics into account. This is particularly important for the estimation of the standard deviation as it is assumed that there is less variations between individuals of the same cluster, and the same strata than in the entire sample. 
If these characteristics are not entered, then the results will not be representative of the total sample. 

2.3.6	Use of cut-off
Specific cut-off are used per population group and for some micronutrients, they are dependent on other factors such as age, fasting and time of data collection. A complete list of the cut-off used is available here. REF to threshold doc?
The default threshold level for deficiency used for STFR is 8.3(mg/l) for all age groups. Users should confirm the threshold according to manufacturer's suggested values.

2.3.7	Adjustment for altitude
Heamoglobin increases with altitude and therefore haemoglobin values should be adjusted for altitude so that they can be compared to sea-level values. The default argument is set to TRUE, if you would not like to apply this adjustment set HaemAltAdjust = FALSE
The adjustement follows the equation described in 

2.3.8	Adjustment for smoking
Smoking increases haemoglobin values and therefore haemoglobin values should be adjusted for smoking status, so they can be compared to non-smoker values. This function assumes the amount of cigarettes per day is not known and assesses only if the individual is a smoker or not. The default argument is set to TRUE, if you would not like to apply this adjustment setHaemSmokeAdjust = FALSE
The smoking adjustment follows the equation described in (Sharma AJ, Addo OY, Mei Z, Suchdev PS. Reexamination of hemoglobin adjustments to define anemia: altitude and smoking. Ann N Y Acad Sci. 2019 Aug;1450(1):190-203. doi: 10.1111/nyas.14167. Epub 2019 Jun 23. PMID: 31231812; PMCID: PMC6697572.)


References

Luo, H.; Addo, Y.; Jahan, A (2021) BRINDA: Computation of BRINDA Adjusted Micronutrient Biomarkers for Inflammation. R package version 0.1.2,
https://github.com/hanqiluo/BRINDA
International Zinc Nutrition Consultative Group (IZiNCG). Assessing Population Zinc Status with Serum Zinc Concentration. IZiNCG Technical Brief No. 2. 2nd ed. Davis, CA: University of California; 2012. www.izincg.org}
Sullivan, K. M., Mei, Z., Grummer-Strawn, L., & Parvanta, I. (2008). Haemoglobin adjustments to define anaemia. Tropical Medicine & International Health, 13(10), 1267-1271.
Allen LH, Miller JW, de Groot L, Rosenberg IH, Smith AD, Refsum H, Raiten DJ. Biomarkers of Nutrition for Development (BOND): Vitamin B-12 Review. J Nutr. 2018 Dec 1;148(suppl_4):1995S-2027S.}
