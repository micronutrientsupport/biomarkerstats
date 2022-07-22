Hello this area is to test the SummaryStats function over all datafiles. 

If you would like to run try this locally, you can: 

1) Download this Github repository 
https://github.com/tb011/biomarkerstats/

    1.1) Click 'Code' (Green button) 
    1.2) Click 'Download ZIP'

2) Extract the zip file

3) Place all the data in the 'tests/development_tests' directory (keep the files that are already in there in the same place) 

4) Test away! 

Option 1: Use 'test-SummaryStats' to test the SummaryStats function over all datafiles. 
 - This is be run everytime you change the SummaryStats script to make sure that we are not making more errors in the process

Option 2: Use 'run-one-biomarker'
 - If you would like to load in and investigate one particular biomarker and run SummaryStats over it

Option 3: Use 'create_RDA_from_CSV'
 - If you would like to make RDA files from CSV files
 - This will make sure that you have the files in the correct format for testing (using 'test-SummaryStats') 

Option 4: Use bash-change-column-names.sh
 - If you would like to do a character string change, globally over multiple files within directory 
 - For example: Changing 'wealthQunitile' to 'wealth_quintile' or changing file names to correct labelling: "S3-AGP-WRA-region-theData.rda"
