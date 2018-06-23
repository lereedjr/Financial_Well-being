library(plyr)
library(ggplot2)
library(factoextra)

#I will load and look at the data
setwd("/Users/MorganSwaney/Desktop/Practicum 1/GitHub/Financial_Well-being")
FS <- read.csv("NFWBS_PUF_2016_data_pared_down_na.csv", header = T)
str(FS)
summary(FS)

#Next I will remove the nulls
FS <- na.omit(FS)
summary(FS)

#I will look at the FS Score distribution 
ggplot(FS, aes(x = FSscore)) + geom_histogram(aes(y =..density..), color = "black", fill = "white") + geom_density(alpha = .2, fill = "#FF6666")
#FSScore is normally distributed 

#Looking at the distributions of the other varaibles
hist(FS$SWB_1, col = "blue", main = "Life satisfaction", labels = T)
#Most respondents have a high level of life satisfaction

hist(FS$SWB_2, col = "blue", main = "Future optimism", labels = T )
#The majority of respondents are optimistic about their future

hist(FS$SWB_3, col = "blue", main = "Future success", labels = T)
#Most respondents feel if they work hard today they will be successful in the future

hist(FS$HOUSING, col = "blue", main = "Housing situation", labels = T)
#Most respondents own their home

hist(FS$LIVINGARRANGEMENT, col = "blue", main = "Living arrangement", labels = T)
#The majority of respondents live with their spouse/partner/significant other

hist(FS$SAVINGSRANGES, col = "blue", main = "Savings amount", labels = T)
#Few respondents have less than $100 in their savings account

hist(FS$EARNERS, col = "blue", main = "Number of earners", labels = T)
#Very few respondents have more than 2 people contributing to their household income

hist(FS$MANAGE2, col = "blue", main = "Manages financial decisions", labels = T)
#Most respondents have some responsibility in managing their household financial decisions

hist(FS$PAREDUC, col = "blue", main = "Education level by parents", labels = T)
#The majority of respondents parents have some or no college and at least a high school or GED degree

hist(FS$HHEDUC, col = "blue", main = "Highest level o education for all household members", labels = T)
#The household or respondents seem to have a higher level of education than their parents 

hist(FS$PPEDUC, col = "blue", main = "Education level of respondent", labels = T)
#The education level of respondents is slightly higher than that of their parents

hist(FS$KIDS_NoChildren, col = "blue", main = "Financially support children", labels = T)
#Most respondents do not financially support children

hist(FS$EMPLOY, col = "blue", main = "Primary employment status", labels = T)
#The majority of respondents work full time for an employer or the military 

hist(FS$agecat, col = "blue", main = "Age", labels = T)
#There are few respondents who fall into the 18 - 24 or 70 - 74 categories

hist(FS$generation, col = "blue", main = "Generation", labels = T)
#Baby boomer generation has the most respondents

hist(FS$PPETHM, col = "blue", main = "Race/Ethnicity", labels = T)
#Most respondents are white, non-Hispanic

hist(FS$PPGENDER, col = "blue", main = "Gender", labels = T)
#There are slightly more males respondents than female

hist(FS$PPHHSIZE, col = "blue", main = "Household size", labels = T)
#The majority of respondents have 2 people in their household 

hist(FS$PPINCIMP, col = "blue", main = "Household income", labels = T)
#The majority of respondents have an household income of $75,000 or greater 

hist(FS$PPMARIT, col = "blue", main = "Marital status", labels = T)
#Most respondents are married 

hist(FS$PPREG4, col = "blue", main = "Census region", labels = T)
#The majority of respondents live in the south 

#Adding lables to the varaibles
FS.Data <- FS
FS.Data$SWB_1 = revalue(factor(FS.Data$SWB_1), c(
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$SWB_2 = revalue(factor(FS.Data$SWB_2), c(
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$SWB_3 = revalue(factor(FS.Data$SWB_3), c(
  `1` = "1 Strongly disagree",
  `2` = "2",
  `3` = "3",
  `4` = "4",
  `5` = "5",
  `6` = "6",
  `7` = "7 Strongly agree"
))
FS.Data$HOUSING = revalue(factor(FS.Data$HOUSING), c(
  `1` = "I own my home",
  `2` = "I rent",
  `3` = "I do not currently own or rent"
))
FS.Data$LIVINGARRANGEMENT = revalue(factor(FS.Data$LIVINGARRANGEMENT), c(
  `1` = "I am the only adult in the household",
  `2` = "I live with my spouse/partner/significant other",
  `3` = "I live in my parents' home",
  `4` = "I live with other family, friends, or roommates",
  `5` = "Some other arrangement"
))
FS.Data$SAVINGSRANGES = revalue(factor(FS.Data$SAVINGSRANGES), c(
  `1` = "0",
  `2` = "$1-99",
  `3` = "$100-999",
  `4` = "$1,000-4,999",
  `5` = "$5,000-19,999",
  `6` = "$20,000-74,999",
  `7` = "$75,000 or more"
))
FS.Data$EARNERS = revalue(factor(FS.Data$EARNERS), c(
  `1` = "One",
  `2` = "Two",
  `3` = "More than two"
))
FS.Data$MANAGE2 = revalue(factor(FS.Data$MANAGE2), c(
  `1` = "Someone else takes care of all or most money matters in my household.",
  `2` = "Someone else and I take care of money matters in my household about the same.",
  `3` = "I take care of all or most money matters in my household."
))
FS.Data$HHEDUC = revalue(factor(FS.Data$HHEDUC), c(
  `1` = "Less than high school",
  `2` = "High school degree/GED",
  `3` = "Some college/Associate",
  `4` = "Bachelor's degree",
  `5` = "Graduate/professional degree"
))
FS.Data$KIDS_NoChildren = revalue(factor(FS.Data$KIDS_NoChildren), c(
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
  `8` = "Retired"
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
str(FS.Data)

#Looking at the variables in relation to FS Score
ggplot(FS.Data, aes(x = FSscore, color = SWB_1)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Life Satisfaction")
ggplot(FS.Data, aes(x = FSscore, color = SWB_2)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Future Optimism")
ggplot(FS.Data, aes(x = FSscore, color = SWB_3)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Work Hard Today = Successful  Future")
ggplot(FS.Data, aes(x = FSscore, color = HOUSING)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Current Housing Situation")
#Respondents who rent their home appear to have lower FS Scores 

ggplot(FS.Data, aes(x = FSscore, color = LIVINGARRANGEMENT)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Current Living Arrangement")
#Respondents who are the only adult in their household appear to have slightly lower FS Scores 

ggplot(FS.Data, aes(x = FSscore, color = SAVINGSRANGES)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Amount in Savings Account")
ggplot(FS.Data, aes(x = FSscore, color = EARNERS)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Number of People Contributing")
ggplot(FS.Data, aes(x = FSscore, color = MANAGE2)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Who Makes Financial Decisions")
ggplot(FS.Data, aes(x = FSscore, color = PAREDUC)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Highest Level of Education by People Who Raise Respondent")
ggplot(FS.Data, aes(x = FSscore, color = HHEDUC)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Education Level of All Members")
ggplot(FS.Data, aes(x = FSscore, color = KIDS_NoChildren)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Supporting Children")
ggplot(FS.Data, aes(x = FSscore, color = EMPLOY)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Primary Employment Status")
ggplot(FS.Data, aes(x = FSscore, color = agecat)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Age")
ggplot(FS.Data, aes(x = FSscore, color = generation)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Generation")
ggplot(FS.Data, aes(x = FSscore, color = PPEDUC)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Education Level")
ggplot(FS.Data, aes(x = FSscore, color = PPETHM)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Ethnicity")
ggplot(FS.Data, aes(x = FSscore, color = PPGENDER)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Gender")
ggplot(FS.Data, aes(x = FSscore, color = PPHHSIZE)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by House Hold Size")
ggplot(FS.Data, aes(x = FSscore, color = PPINCIMP)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Income")
ggplot(FS.Data, aes(x = FSscore, color = PPMARIT)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Martial Status")
ggplot(FS.Data, aes(x = FSscore, color = PPREG4)) + geom_histogram(fill = "white") + ggtitle("Financial Stability Score by Census Region")

#Starting the cluster analysis by removing the FS Score
FS2 <- FS[, -4]
str(FS2)

#Using the elbow method to determin which value of K to use
fviz_nbclust(FS2, kmeans, method = "wss")
#I will K = 8 

#Running the cluster analysis
set.seed(234)
fs.cluster <- kmeans(FS2, 8)
fs.cluster$size
format(round(fs.cluster$centers, 0), nsmall = 0)
#Rounding the centers since the varaibles are categorical. 

#Adding the cluster to the organial data 
FS$Cluster <- fs.cluster$cluster
FS$Cluster <- as.factor(FS$Cluster)
str(FS)

#Running an ANOVA to test if the FS Score is different based on the clusters
#Ho: Cluster FS Scores are the same
#Ha: Cluster FS Scores are not the same
#alpha = 0.05
fit <- aov(FS$FSscore ~ FS$Cluster)
summary(fit)
#P-value is less than alpha so I reject the null and assume the cluster FS Scores are not the same.

#Running Tukey HSD to determin which clusters are different 
posthoc <- TukeyHSD(fit, conf.level = 0.95)
posthoc
#I can see there FS Score for some of the clusters are not different. There is no statsticall difference in FS Score between the following clusters 
#1,3 and 7 
#2 and 5
#6 and 8



















