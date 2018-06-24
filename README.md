# Financial Well-being Survey Analysis

## Intorduction
I used the survey data from the Consumer Financial Protection Bureau on financial well-being. The survey data was released in October 2017 and can be found [the survey’s website](https://www.consumerfinance.gov/data-research/financial-well-being-survey-data/)

The dataset consists of over 200 variables that are used to examine financial well-being and understand what factors influence financial well-being. The idea of financial well-being is derived from a sense of financial security and having a freedom of choice in the future and present. 

## Inspiration 
I choose to use this dataset for my practicum because I am interested in answering the following questions:
1. Are there clusters within the data?
2. Do these clusters have different financial stability scores?
3. What makes these clusters different?

## Data
For this project I narrowed the data list down to 22 variables: 

The variables I'm using are:
* SWB_1, I am satisfied with my life 
* SWB_2, I am optimistic about my future 
* SWB_3, If I work hard today, I will be more successful in the future 
* HOUSING, Which one of the following best describes your housing situation? 
* LIVINGARRANGEMENT, Current living arrangements 
* SAVINGSRANGES, How much money do you have in savings today...?  
* EARNERS, Household members currently contributing to paying household bills 
* MANAGE2, Who in household makes financial decisions 
* PAREDUC, Highest level of education by person/people who raised respondent 
* HHEDUC, Highest level of education of all household members 
* KIDS_NoChildren, I have no children that I support financially 
* EMPLOY, Primary or only employment status 
* agecat, Age
* generation, Generation
* PPEDUC, Education (Highest Degree Received) 
* PPETHM, Race / Ethnicity 
* PPGENDER, Gender
* PPHHSIZE, Household size
* PPINCIMP, Household Income
* PPMARIT, Marital Status
* PPREG4, Census Region
* PPREG9, Census Division

I’m using the FSscore or financial stability score as my dependent variable  and the other 21 variables as my independent variables. I chose these variables to analyze to see how demographic information, life satisfaction, future optimism, and future success interact and impact the feeling of financial stability. There are many other very interesting variables to look at but there were my top pick. I’m keeping many of the demographic variables because the FSscore is designed to not be influenced by demographics, according the Consumer Financial Protection Bureau technical guide. 

FSscore Distribution 
 ![alt text](https://github.com/mcassimus1/Financial_Well-being/blob/master/FSscore%20DIstribution.png)

## Analysis
Analysis Steps
 ![alt text](https://github.com/mcassimus1/Financial_Well-being/blob/master/Analysis.png)






