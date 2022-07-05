cd C:/Users/sbztb3/Documents/University_of_Nottingham/biomarkerstats/inst/production-data/88_tests/R-inputs/test/S2

ls
# Changing string within text files using bash
# change to sed -i (to replace text in files! )

echo 'surveyId groupId regionName wealthQuintile urbanity'| sed -e 's/groupId/group_id/g'

# this will print the text change to the terminal
sed 's/whatever/something/g;s/whateverelse/somethingelse/g' file.txt

# this will replace the text inside the file
sed -i 's/whatever/something/g;s/whateverelse/somethingelse/g' file.txt

# String changes to be made for ALL source files
# S2 = Malawi
# S3 = Ethiopia

# 1) "regionName" -> "region" for all files
# 2) "wealthQuintile" -> "wealth_quintile" for all files
# 3) "groupId" -> "group_id" for all files

sed -i 's/regionName/region/g;s/wealthQuintile/wealth_quintile/g' *.txt

# Change biomarker names to new names

# 1)
sed -i 's/vitaminB12/vitamin_b12/g;s/rbcFolate/rbc_folate/g;s/psFolate/ps_folate/g' *.txt


# Make copies of S2 Malawi WRA (wealth_quintile, region & urbanity) for MEN, PSC & SAC
# from previously existing WRA source files
# 3) cp WRA source files (30 files) x 3 more times (total 120 source files for Malawi)
# copied files to S2 directory
# NB: sed changes the string inside the file from WRA to MEN, then changes the
# fileanme from *WRA to *MEN


for file in $WRA*
do
  sed 's/WRA/MEN/g' $file > ${file/WRA/MEN}
  sed 's/WRA/SAC/g' $file > ${file/WRA/SAC}
  sed 's/WRA/PSC/g' $file > ${file/WRA/PSC}
done

# TOTAL FILE COUNT
# S2 Malawi source files = 120 (group_id [4] x biomarker [10] x variable [3])
# S3 Ethiopia source files = 108 (group_id [4] x biomarker [9] x variable [3])

# Make S3 (Ethiopian) source files
# Go one directory upwards
cd ..

# make a new directory called S3
cp -R S2 S3

# rename S2 files to S3
cd ./S3

for file in *
do
  mv "$file" "${file/S2/S3}"
done

rm *rbp*





