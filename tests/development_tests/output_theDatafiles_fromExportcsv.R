# Script to import CSV file and out RDA files for testing (takes full CSV with all biomarkers)

# 1) Change working directory to this (source) file's directory
# (Session > Set Working Directory > To Source File Location)

# 2) Place CSV files in the same location as this script

# Set files and extension function (filename must be "exportGROUP_IDcountry.csv)
fileExtension <- function(extension){
  country_list <- strsplit(list.files(, pattern = paste0(".", extension)), paste0(".", extension))
  country_list <- substr(country_list, 10, nchar(country_list))
  return(list(extension = extension, country_list = country_list))
}

# invoke the function by stating the extension of the file
input_files <- fileExtension(extension = "csv")
extension <- input_files$extension
country_list <- input_files$country_list

# Set biomarkers for analysis for each country
biomarker_list_ethiopia <- c("agp",
                             "crp",
                             "ferritin",
                             "haemoglobin",
                             "iodine",
                             "retinol",
                             "stfr",
                             "vitamin_b12",
                             "zinc")

biomarker_list_malawi <- c(biomarker_list_ethiopia, "rbp")

setDataset <- function(extension, country){
  file_list <- list.files(pattern = paste0("\\", country, ".", extension, "$"))
  biomarker_list <- if(country == "Malawi"){
    biomarker_list_malawi
  } else if(country == "Ethiopia"){
    biomarker_list_ethiopia
  }
  country_code <- if(country == "Malawi"){
    "S2"
  } else if(country == "Ethiopia"){
    "S3"
  }
  return(list(biomarker_list = biomarker_list, extension = extension,
              file_list = file_list, country = country,
              country_code = country_code))
}

# Invoke the function for the given country (for each country - loop)

for (country in country_list){

  dataset_variables <- setDataset(extension = extension, country = country)

  # Get variable into local environment for next generateRDAs function
  biomarker_list <- dataset_variables$biomarker_list
  extension <- dataset_variables$extension
  file_list <- dataset_variables$file_list
  country <- dataset_variables$country
  country_code <- dataset_variables$country_code


  # Generate RDA files
  generateRDAs <- function(file, biomarker){
    theData <- read.csv(file)
    groupId <- theData[, "group_id"][1]
    save(theData, file = paste0(country_code, "-", biomarker, "-", groupId, "-", "theData.rda"))
  }


  for (file in file_list){
    for(biomarker in biomarker_list) {
      generateRDAs(file = file, biomarker = biomarker)
    }
  }
}

