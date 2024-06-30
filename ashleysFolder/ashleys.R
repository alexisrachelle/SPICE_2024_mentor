## ——— Libraries ——— ##
install.packages("haven")
library(haven)
library(tidyverse)
library(dplyr)
library(ggplot2)

## ——— Importing Dataset ——— ##
DepressionAnxietyStress <- read_sav("DataOnVictimisationDepressionAnxietyStress_updated.sav")

View(DepressionAnxietyStress)
names(DepressionAnxietyStress)
