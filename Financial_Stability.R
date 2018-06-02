setwd("/Users/MorganSwaney/Desktop/Practicum 1")
FS.Data <- read.csv("NFWBS_PUF_2016_data_pared_down.csv", header = T)
head(FS.Data)
str(FS.Data)
summary(FS.Data)

library(plyr)
##I will change the lables to the data. This code is from Consumer Financial Protection Bureau
FS.Data$SWB_1 = revalue(factor(FS.Data$SWB_1), c(
  `-4` = "Response not written to database",
  `-1` = "Refused",
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$SWB_2 = revalue(factor(FS.Data$SWB_2), c(
  `-4` = "Response not written to database",
  `-1` = "Refused",
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$SWB_3 = revalue(factor(FS.Data$SWB_3), c(
  `-4` = "Response not written to database",
  `-1` = "Refused",
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$HOUSING = revalue(factor(FS.Data$HOUSING), c(
  `-1` = "Refused",
  `1` = "I own my home",
  `2` = "I rent",
  `3` = "I do not currently own or rent"
))
FS.Data$LIVINGARRANGEMENT = revalue(factor(FS.Data$LIVINGARRANGEMENT), c(
  `-1` = "Refused",
  `1` = "I am the only adult in the household",
  `2` = "I live with my spouse/partner/significant other",
  `3` = "I live in my parents' home",
  `4` = "I live with other family, friends, or roommates",
  `5` = "Some other arrangement"
))
FS.Data$SAVINGSRANGES = revalue(factor(FS.Data$SAVINGSRANGES), c(
  `-1` = "Refused",
  `1` = "0",
  `2` = "$1-99",
  `3` = "$100-999",
  `4` = "$1,000-4,999",
  `5` = "$5,000-19,999",
  `6` = "$20,000-74,999",
  `7` = "$75,000 or more",
  `98` = "I don't know",
  `99` = "Prefer not to say"
))
FS.Data$EARNERS = revalue(factor(FS.Data$EARNERS), c(
  `-1` = "Refused",
  `1` = "One",
  `2` = "Two",
  `3` = "More than two"
))
FS.Data$MANAGE2 = revalue(factor(FS.Data$MANAGE2), c(
  `-1` = "Refused",
  `1` = "Someone else takes care of all or most money matters in my household.",
  `2` = "Someone else and I take care of money matters in my household about the same.",
  `3` = "I take care of all or most money matters in my household."
))
FS.Data$HHEDUC = revalue(factor(FS.Data$HHEDUC), c(
  `-1` = "Refused",
  `1` = "Less than high school",
  `2` = "High school degree/GED",
  `3` = "Some college/Associate",
  `4` = "Bachelor's degree",
  `5` = "Graduate/professional degree"
))
FS.Data$KIDS_NoChildren = revalue(factor(FS.Data$KIDS_NoChildren), c(
  `-1` = "Refused",
  `0` = "Respondent financially supports children",
  `1` = "I have no children that I financially support"
))
FS.Data$EMPLOY = revalue(factor(FS.Data$EMPLOY), c(
  `1` = "Self-employed",
  `2` = "Work full-time for an employer or the military",
  `3` = "Work part-time for an employer or the military",
  `4` = "Homemaker",
  `5` = "Full-time student",
  `6` = "Permanently sick, disabled or unable to work",
  `7` = "Unemployed or temporarily laid off",
  `8` = "Retired",
  `99` = "Refused"
))
FS.Data$agecat = revalue(factor(FS.Data$agecat), c(
  `1` = "18-24",
  `2` = "25-34",
  `3` = "35-44",
  `4` = "45-54",
  `5` = "55-61",
  `6` = "62-69",
  `7` = "70-74",
  `8` = "75+"
))
FS.Data$generation = revalue(factor(FS.Data$generation), c(
  `1` = "Pre-Boomer",
  `2` = "Boomer",
  `3` = "Gen X",
  `4` = "Millennial"
))
FS.Data$PPEDUC = revalue(factor(FS.Data$PPEDUC), c(
  `1` = "Less than high school",
  `2` = "High school degree/GED",
  `3` = "Some college/Associate",
  `4` = "Bachelor's degree",
  `5` = "Graduate/professional degree"
))
FS.Data$PPETHM = revalue(factor(FS.Data$PPETHM), c(
  `1` = "White, Non-Hispanic",
  `2` = "Black, Non-Hispanic",
  `3` = "Other, Non-Hispanic",
  `4` = "Hispanic"
))
FS.Data$PPGENDER = revalue(factor(FS.Data$PPGENDER), c(
  `1` = "Male",
  `2` = "Female"
))
FS.Data$PPHHSIZE = revalue(factor(FS.Data$PPHHSIZE), c(
  `1` = "1",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5+"
))
FS.Data$PPINCIMP = revalue(factor(FS.Data$PPINCIMP), c(
  `1` = "Less than $20,000",
  `2` = "$20,000 to $29,999",
  `3` = "$30,000 to $39,999",
  `4` = "$40,000 to $49,999",
  `5` = "$50,000 to $59,999",
  `6` = "$60,000 to $74,999",
  `7` = "$75,000 to $99,999",
  `8` = "$100,000 to $149,999",
  `9` = "$150,000 or more"
))
FS.Data$PPMARIT = revalue(factor(FS.Data$PPMARIT), c(
  `1` = "Married",
  `2` = "Widowed",
  `3` = "Divorced/Separated",
  `4` = "Never married",
  `5` = "Living with partner"
))
FS.Data$PPREG4 = revalue(factor(FS.Data$PPREG4), c(
  `1` = "Northeast",
  `2` = "Midwest",
  `3` = "South",
  `4` = "West"
))
FS.Data$PPREG9 = revalue(factor(FS.Data$PPREG9), c(
  `1` = "New England",
  `2` = "Mid-Atlantic",
  `3` = "East-North Central",
  `4` = "West-North Central",
  `5` = "South Atlantic",
  `6` = "East-South Central",
  `7` = "West-South Central",
  `8` = "Mountain",
  `9` = "Pacific"
))
str(FS.Data)

library(ggplot2)
ggplot(FS.Data, aes(x = FSscore)) + geom_histogram(aes(y =..density..), color = "black", fill = "white") + geom_density(alpha = .2, fill = "#FF6666")

ggplot(FS.Data, aes(x = FSscore, color = generation)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Generation")
ggplot(FS.Data, aes(x = FSscore, color = PPGENDER)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Gender")
ggplot(FS.Data, aes(x = FSscore, color = PPETHM)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Ethnicity")
ggplot(FS.Data, aes(x = FSscore, color = PPEDUC)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Education Level")
ggplot(FS.Data, aes(x = FSscore, color = PPINCIMP)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Income")
ggplot(FS.Data, aes(x = FSscore, color = PPMARIT)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Martial Status")
ggplot(FS.Data, aes(x = FSscore, color = PPREG4)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Census Region")


