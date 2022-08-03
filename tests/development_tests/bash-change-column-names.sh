## Shell script to make and edit source files

# 1) Change working directory to this (source) file's directory
# (R Studio: Session > Set Working Directory > To Source File Location)

# 2) Use the Terminal instead of the Console
# Press on keyboard: Alt+Shift+R

## WARNING! Please be aware that these are irreverable file system level changes,
# so you may like to practice in a test directory first.

## EXAMPLE to make selenium source files for SummaryStats function
# STEP 1:
# Place three WRA source files in directory (wealth_quintile, region, urbanity)
# Now using this loop: duplicate WRA files for each group ID of interest

for file in $WRA*;
 do
   sed 's/WRA/MEN/g' $file > ${file/WRA/MEN};
   sed 's/WRA/SAC/g' $file > ${file/WRA/SAC};
   sed 's/WRA/PSC/g' $file > ${file/WRA/PSC};
 done

# STEP 2: Change filename

for file in *; do
 mv "$file" "`echo $file | sed "s/zinc/selenium/"`";
done

# STEP 3: Change string WITHIN file
 sed -i 's/zinc/selenium/g' *.txt

# More examples

# Change string within text files using bash
# use command sed -i (to replace text INSIDE files)

# Example
# This will print changes of input text, and result of instruction to change
# 'GroupId' to 'group_id' in character string to the terminal:

echo 'surveyId groupId regionName wealthQuintile urbanity'| sed -e 's/groupId/group_id/g'

# This command will replace text INSIDE the file
# file.txt is the file you would like to change the text inside
# file.txt is your file of interest

# sed -i 's/whatever/something/g;s/whateverelse/somethingelse/g' file.txt

## String changes to be made for ALL source files
# S2 = Malawi
# S3 = Ethiopia

# 1) "regionName" -> "region" for all files
# 2) "wealthQuintile" -> "wealth_quintile" for all files
# 3) "groupId" -> "group_id" for all files

# sed -i 's/regionName/region/g;s/wealthQuintile/wealth_quintile/g;s/groupId/group_id/g' *.txt

# Change biomarker names to new names:
# "rbcFolate" -> "rbc_folate"
# "psFolate -> "ps_folate"

# sed -i 's/vitaminB12/vitamin_b12/g;s/rbcFolate/rbc_folate/g;s/psFolate/ps_folate/g' *.txt

# Make copies of S2-WRA source files (wealth_quintile, region & urbanity)
# for other group ids (MEN, PSC & SAC) from previously existing WRA source files
# copied files to directory using the (cp command)

# Change FILENAME from regionName to Region
for file in *; do
  mv "$file" "`echo $file | sed "s/regionName/region/"`";
done

# Make sure sensitive to case
# Change FILENAME from wealthQunitile to wealth_quintile
# AND vitaminB12 to vitamin_b12 in one line

for file in *;
do
  mv "$file" "`echo $file | sed "s/wealthQuintile/wealth_quintile/;s/vitaminB12/vitamin_b12/g"`";
done

## Other useful bash commands

# Be sure you would like to execute commands, before executing, or practice first
# on a test directory!

# List all files in current working directory
ls

# list all file that begin with 'S2'
ls -a S2*

# make a new directory called 'S3'
mkdir S3

# Move all files that begin with 'S1' to 'S3' folder
cp -r S1* S3

# Rename beginning of filename from S1 to S4
for file in S1* ; do mv $file ${file//S1/S4} ; done


