#### Preamble ####
# Purpose: Downloads and saves the data from https://www.openicpsr.org/openicpsr/project/193523/version/V1/view
# Author: Sakura, Yan, Christina
# Date: 13 February 2023
# Contact: 
# Pre-requisites: must download all the data sets from https://www.openicpsr.org/openicpsr/project/193523/version/V1/view?path=/openicpsr/193523/fcr:versions/V1/Raw&type=folder and save it in the inputs/data folder


#### Workspace setup ####
library(knitr)
library(janitor)
library(tidyverse)
library(readr)
library(dplyr)
library(tidyr)
library(kableExtra)
library(haven)
library(tsibble)
library(ggplot2)

#### Clean data ####





####Third####
raw_d <- read_dta("../../inputs/data/nces_district_enrollment_2018_2020.dta")
other_raw <- read_csv("../../inputs/data/District_Overall_Shares.csv")
other_raw <- other_raw|>
  rename(leaid = "NCESDistrictID")
other_raw$leaid <- as.character(other_raw$leaid)

data <- raw_d |>
  filter(grade == 0 | grade == 99) |>
  filter(race == 99)

# Delete race as we don't need it
data <- subset(data, select = -race)

# Drop observations where enrollment is less than 0
data <- data[data$enrollment >= 0, ]

# Drop observations where fips is greater than 56
data <- data[data$fips <= 56, ]

data <- data |>
  filter(!is.na(sex))


# Reshape 'enrollment' wide by 'leaid', 'year', and 'grade'
data_wide <- pivot_wider(data,
                         names_from = sex,
                         values_from = enrollment) |>
  rename(
    enrollment1 = `1`,
    enrollment2 = `2`,
    enrollment9 = `9`,
    enrollment99 = `99`)

# Drop the 'enrollment9' variable
data_wide$enrollment9 <- NULL

# Drop observations where 'enrollment99' is missing or less than or equal to 0
data_wide <- data_wide[!is.na(data_wide$enrollment99) & data_wide$enrollment99 > 0, ]

# Reshape 'enrollment1', 'enrollment2', and 'enrollment99' wide by 'leaid' and 'year'
data_final <- pivot_wider(data_wide,
                          names_from = grade,
                          values_from = c(enrollment1, enrollment2, enrollment99))
# Can get rid of fips

data_final <- subset(data_final, select = -fips)

# Rename columns
colnames(data_final) <- c("year", "leaid", 
                          "enroll_male_kinder", "enroll_female_kinder", 
                          "enroll_male_total", "enroll_female_total", 
                          "enroll_all_kinder", "enroll_all_total")

# Convert 'leaid' to numeric (assuming it's a string)
data$leaid <- as.numeric(data$leaid)
other_raw$leaid <- as.numeric(other_raw$leaid)

write_csv(x = data_final,
          file = "../data/cleaned_raw_data.csv")