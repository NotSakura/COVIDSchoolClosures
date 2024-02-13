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

#### Simulate data ####







### First stimulated data
set.seed(123)

# Generate 1000 samples for each column and put in data frame
stimulated_data <- data.frame(
  years <- sample(2000:2024, 1000, replace = TRUE),
  state <- sample(1:1000, 1000, replace = TRUE),
  enrollment_kinder <- rpois(1000, lambda = 100),
  enrollment_total <- enrollment_kinder + rpois(1000, lambda = 400),
  share_inperson <- runif(1000, min = 0, max = 1)
)






