# Script to import CSV file and output RDA files for testing
# (takes full CSV with all biomarkers)

# 1) Change working directory to this (source) file's directory
# (Session > Set Working Directory > To Source File Location)

# 2) Place CSV files in the same location as this script

# Set files and extension function (filename must be "exportGROUPIDCountry.csv)
# Output needs to be countrycode-biomarker-groupid-variable-theData.rda
# i.e. S3-ferritin-MEN-wealth_quintile-theData.rda

fileExtension <- function(extension){
  country_list <- strsplit(list.files(, pattern = paste0(".", extension)), paste0(".", extension))
  country_list <- unique(substr(country_list, 10, nchar(country_list)))
  return(list(extension = extension, country_list = country_list))
}

# invoke the function by stating the extension of the file
input_files <- fileExtension(extension = "csv")
extension <- input_files$extension
country_list <- as.list(input_files$country_list)


# Set biomarkers for analysis for each country
biomarker_list_Ethiopia <- c("agp",
                             "crp",
                             "ferritin",
                             "haemoglobin",
                             "iodine",
                             "retinol",
                             "stfr",
                             "vitamin_b12",
                             "zinc")

biomarker_list_Malawi <- c(biomarker_list_Ethiopia, "rbp")

variable_list <- c("wealth_quintile", "region", "urbanity")

setDataset <- function(extension, country){
  file_list <- list.files(pattern = paste0("\\", country, ".", extension, "$"))
  if(country == "Malawi"){
    biomarker_list <- biomarker_list_Malawi
    country_code <- "S2"
  } else if(country == "Ethiopia"){
    biomarker_list <- biomarker_list_Ethiopia
    country_code <- "S3"
  }
  return(list(country = country, biomarker_list = biomarker_list, extension = "csv",
              file_list = file_list,
              country_code = country_code))
}

# country = "Ethiopia"
#   lapply(X= country_list, FUN = setDataset, country = country)


# Invoke the function for the given country (for each country - loop)

for (country in country_list){

  dataset_variables <- setDataset(extension = extension, country = country)

  # Get variable into local environment for next generateRDAs function

  country <- dataset_variables$country
  country_code <- dataset_variables$country_code
  biomarker_list <- dataset_variables$biomarker_list
  extension <- dataset_variables$extension
  file_list <- dataset_variables$file_list


  # Generate RDA files
  generateRDAs <- function(file, biomarker, variable){
    theData <- read.csv(file)
    group_id <- theData[, "group_id"][1]
    save(theData, file = paste0(country_code, "-", biomarker, "-", group_id, "-", variable, "-", "theData.rda"))
  }


  for (file in file_list){
    for (variable in variable_list){
      for(biomarker in biomarker_list) {
        generateRDAs(file = file, biomarker = biomarker, variable = variable)
      }
    }
  }
}

