#### Preamble ####
# Purpose: Downloads and saves the data from https://www.openicpsr.org/openicpsr/project/193523/version/V1/view
# Author: Sakura Noskor, Yan Mezhiborsky, Cristina Burca
# Date: 13 February 2023
# Contact: cristina.burca@mail.utoronto.ca, sakura.noskor@mail.utoronto.ca,  yan.mezhiborsky@mail.utoronto.ca
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

#### Test data ####

cleaned_data3 <- read_csv("../outputs/data/cleaned_raw_data.csv")

# look for any empty values in data and repl
any_empty <- any(is.na(cleaned_data3))

# check years are not in future
cleaned_data3$year |> max() <= 2024

# check if values of enrollment number is actually a number
cleaned_data3$enroll_male_kinder |> class() == "numeric"
cleaned_data3$enroll_female_kinder |> class() == "numeric"
cleaned_data3$enroll_male_total |> class() == "numeric"
cleaned_data3$enroll_female_total |> class() == "numeric"
cleaned_data3$enroll_all_kinder |> class() == "numeric"
cleaned_data3$enroll_all_total |> class() == "numeric"




