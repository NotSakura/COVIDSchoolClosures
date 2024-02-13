#### Preamble ####
# Purpose: Downloads and saves the data from https://www.openicpsr.org/openicpsr/project/193523/version/V1/view
# Author: Sakura, Yan, Christina
# Date: 13 February 2023
# Contact: Sakura.noskor@mail.utoronto.ca, 
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



         
