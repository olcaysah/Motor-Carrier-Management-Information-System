#' Author: Olcay Sahin
#' Date: Thu Nov 06 10:45:56 2019
#' Author email: osahi001@odu.edu
#' Project:
#' Info:
#' --------------

library(shiny)
library(leaflet)
library(data.table)
library(dplyr)
library(RPostgreSQL)
source('loadData.R')
library(shinycssloaders)

ca_states <- fread('canada_states.csv')
mx_states <- fread('mexico_states.csv')
