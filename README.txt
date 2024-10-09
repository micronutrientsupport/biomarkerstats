Hello, biomarkerstats is a package that computes summary statistics for National Micronutrient Surveys. 

For the function that runs this analysis, please nagivate to: 

https://github.com/tb011/biomarkerstats/blob/master/R/summaryStats.R

If you would like test/run the SummaryStats function over multiple datafiles, please navigate to tests/development_tests.

You can run this on your local computer by doing the following: 

1) Download the Github repository 
https://github.com/tb011/biomarkerstats/

    1.1) Click 'Code' (Green button) 
    1.2) Click 'Download ZIP'

2) Extract the zip file

3) Place all the data in the 'tests/development_tests' directory (keep the files that are already in there in the same place) 

4) Test away! 

Option 1: Use 'test-SummaryStats' to test the SummaryStats function over all datafiles. 
 - This is be run everytime you change the SummaryStats script to ensure that you are not making more errors in the process
 - You can also compare two scripts (i.e. analysis one with and without survey weights) to observe the differences over multiple datafiles 

Option 2: Use 'run-one-biomarker'
 - If you would like to load in and investigate one particular biomarker and run SummaryStats over it
 - You can also change some function parameters and observe the difference in one datafile

Option 3: Use 'create_RDA_from_CSV'
 - If you would like to make RDA files from CSV files
 - This will make sure that you have the files in the correct format for testing (using 'test-SummaryStats') 

Option 4: Use bash-change-column-names.sh
 - If you would like to do a character string change, globally over multiple files within directory 
 - For example: Changing 'wealthQunitile' to 'wealth_quintile' or changing file names to correct labelling: "S3-AGP-WRA-region-theData.rda"
