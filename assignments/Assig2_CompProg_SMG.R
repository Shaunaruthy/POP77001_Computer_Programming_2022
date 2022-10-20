library(tidyverse)
library(broom) 
library(tidyverse)
library(lubridate)

install.packages("tidyverse")

pkgTest <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,  "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,  dependencies = TRUE)
  sapply(pkg,  require,  character.only = TRUE)
}

library("dplyr")

dat <- read.csv("C:\\Users\\shauna-mcgeever\\Documents\\GitHub\\POP77001_Computer_Programming_2022\\assignments\\kaggle_survey_2021_responses.csv")


#In question 7 respondents were asked 
#"What programming languages do you use on a regular basis? 
#(Select all that apply)". 
#Calculate percentages of respondents who use each of the programming languages. 
#Sort them by popularity.


#Q7 1-13

library(tidyr)

filter(dat, dat$Q7_Part_1)

datwithlevels <- factor(dat$Q7_Part_1, dat$Q7_Part_2,, 
                          levels = c("G", "PG", "PG-13", # new level order
                                     "R", "NC-17", "Unrated"))

dat_Tibble <- tibble(dat$Q7_Part_1, dat$Q7_Part_2,dat$Q7_Part_3,
                     dat$Q7_Part_4,dat$Q7_Part_5,dat$Q7_Part_6,
                     dat$Q7_Part_7,dat$Q7_Part_8,dat$Q7_Part_9,
                     dat$Q7_Part_10,dat$Q7_Part_11,
                     dat$Q7_Part_12,
                     dat$Q7_OTHER)


print(dat_Tibble)


dat_Tibble <- dat_Tibble[-c(1), ]


dat_Tibble

Lessrows <- dat_Tibble %>%
tidyr::pivot_longer(cols = c("dat$Q7_Part_1", "dat$Q7_Part_2",
"dat$Q7_Part_3","dat$Q7_Part_4","dat$Q7_Part_5",
"dat$Q7_Part_6","dat$Q7_Part_7","dat$Q7_Part_8","dat$Q7_Part_9",
"dat$Q7_Part_10","dat$Q7_Part_11","dat$Q7_Part_12",
"dat$Q7_OTHER"), 
names_to = "Question", 
values_to = "Answers",)

Lessrows <- Lessrows[-c(1:13), ]

Lessrows


unique(lessrows$Answers)
                    

Lessrows %>%
group_by(Answers)