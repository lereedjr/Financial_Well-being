# Financial Well-being Survey Analysis

## Intorduction
I used the survey data from the Consumer Financial Protection Bureau on financial well-being. The survey data was released in October 2017 and can be found at [the survey’s website](https://www.consumerfinance.gov/data-research/financial-well-being-survey-data/)

The dataset consists of over 200 variables that are used to examine financial well-being and understand what factors influence financial well-being. The idea of financial well-being is derived from a sense of financial security and having a freedom of choice in the future and present. 

## Questions 
I choose to use this dataset for my practicum because I am interested in answering the following questions:
1. Are there clusters within the data?
2. What makes these clusters different?
3. Do these clusters have different financial stability scores? 

## Data
After reading about the different varaibles I narrowed the list down to 23 variables: 
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
* FSscore, Financial stability score

I’m using the FSscore as my dependent variable and the other 22 variables as independent variables. I chose these variables to analyze to see how demographic information, education levels, life satisfaction, future optimism, and ideas about future success interact and impact with financial stability. There are many other very interesting variables to look at but there were my top picks. I’m using many of the demographic variables because the FSscore is designed to not be influenced by demographics, according the [Consumer Financial Protection Bureau technical guide](https://www.consumerfinance.gov/data-research/research-reports/financial-well-being-technical-report/).

FSscore Distribution 
 ![alt text](https://github.com/mcassimus1/Financial_Well-being/blob/master/FSscore%20DIstribution.png)

## Analysis
Analysis Steps
 ![alt text](https://github.com/mcassimus1/Financial_Well-being/blob/master/Analysis.png)

### Exploratory Data Analysis 
After choosing the variables, I began to do some exploratory data analysis. I created histograms of FSscore and the different variables to see if anything interesting showed up. I also looked at the independent variables alone and found the dataset didn’t have any nulls. According to the definition code book the non-answered responses were recoded with either negative numbers (-1 or -4) or large numbers (99 and 98). When looking at the distribution of the variables these didn’t impact anything however, when I started to explore the cluster analysis and the centers of the clusters this greatly impacted the results.

### Data Clean Up 
After recognizing the impact these negative and large numbers had on the cluster analysis I removed them from the dataset replacing with them with nulls. I then removed the nulls from any further analysis. 

### Exploratory Data Analysis Part 2 
In the second part of exploratory data analysis  I followed a similar path as I did the first time around. I created histograms of each variable by itself and then overlaid on the FSscore to gain a better understanding of how the independent variables and dependent variables interacted. I also run a correlation on all the dependent variables to identify possible correlations. There were some surprising and some not surprising correlations found.

* Life satisfaction and future optimism 
* Future optimism and work hard today to leads to success in the future
* Housing situation and marital status 
* Amount in savings and household income 
* Parents highest level of education, highest level of education in the household, and respondents level of education 
* Financially supporting kids and household size 
* Employment and age category 
* Employment and generation 
* Age category and generation 
* Respondents level of education and household income 

Some other interesting things that were discovered in the second phase of the exploratory data analysis were:
* Overall the majority of respondents are satisfied with their life, have medium to high levels of future optimism, and feel that their hard work today will turn into future success. 
* Respondents who rent their homes appear to have lower FSscores than those who own their homes. 
* Respondents who are the only adult in their household have slightly lower FSscores than others. 

### Cluster Analysis 
To begin the cluster analysis I removed the FSscore from the data since I don’t want the clusters to be influenced by the FSscore. I opted not to scale the data because the variables are truly categorical and I wanted to be able to identify which category in the variables the cluster identified with. I used a kmean cluster method to determine the clusters and the elbow method to determine what value of K to use. Using K = 8, I run the kmean for the 8 clusters and then using the center for each variables identified what category they identify with. 

##### Cluster 1
* Medium level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Rent their home
* Live with spouse/partner/significant other 
* Have between $1,000 and $4,999 in savings
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have bachelor’s degree 
* Highest degree in the household is a bachelor’s degree
* Is not financially responsible for kids 
* Employed part-time
* Between 25 – 34 years old
* Millennial generation 
* Their level of education is a bachelor’s degree 
* Black, non-Hispanic 
* Male
* 3 members in the household 
* Household income is between $75,000 and $99,000
* Never married 
* Live in the south

##### Cluster 2 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Own their home
* Live with spouse/partner/significant other 
* Have between $20,000 and $74,999 in savings account
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have some college
* Highest degree in the household is a bachelor’s degree
* Is not financially responsible for kids 
* Retired
* Between the ages of 70 and 74
* Boomer generation 
* Their level of education is a bachelor’s degree 
* White, non-Hispanic 
* Male
* Household size is 2
* Household income is between $75,000 and $99,000
* Married
* Live in the south

##### Cluster 3 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Rent their home
* Live with spouse/partner/significant other 
* Have between $100 and $999 in savings account 
* Two earners in the household
* Share financial decision making with another member of the household
* Parents have some college
* Highest degree in the household is some college 
* Is financially responsible for kids
* Employed part-time 
* Between 35 – 44 years old
* Gen X generation 
* Their level of education is some college 
* Black, non-Hispanic 
* Female
* Household size is 3
* Household income is between $30,000 and $39,999
* Divorced/separated
* Live in the South

##### Cluster 4 
* Medium level of life satisfaction 
* Medium level of future optimism 
* Medium level of idea working hard today means future success 
* Own their home
* Live with spouse/partner/significant other 
* Have between $1,000 and $4,999 in savings
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have some college
* Highest degree in the household is some college 
* Is financially responsible for kids
* Employed full-time 
* Between 45 and 54 years old 
* Gen X generation 
* Their level of education is some college
* White, non-Hispanic 
* Male
* Household size is 3
* Household income is between $60,000 and $74,999
* Widowed
* Live in the south 

##### Cluster 5 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Own their home
* Live with spouse/partner/significant other 
* Have between $20,000 and $74,999 in savings account
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have some college
* Highest degree in the household is a bachelor’s degree
* Is financially responsible for kids
* Employed full-time
* Between 45 and 54 years old 
* Gen X generation 
* Their level of education is a bachelor’s degree 
* White, non-Hispanic 
* Male
* Household size is 3
* Household income is between $100,000 and $149,000 
* Live in the south 

##### Cluster 6 
* Medium – low level of life satisfaction 
* Neutral level of future optimism 
* Neutral  level of idea working hard today means future success 
* Rent their home
* Live with spouse/partner/significant other 
* Have between $1 - $99 in savings account 
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have high school or GED degree 
* Highest degree in the household is some college 
* Is not financially responsible for kids 
* Is a homemaker 
* Is between 35 and 44 years old 
* Gen X generation 
* Their level of education is high school or GED degree  
* Black, non-Hispanic 
* Female 
* Household size is 2 
* Household income is between $20,000 and $29,999
* Divorced/Separated 
* Lives in the south 

##### Cluster 7 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Own their home
* Live with spouse/partner/significant other 
* Has between $1,000 and $4,999 in savings 
* Two earners in the household 
* Have sole responsibility for financial decisions 
* Parents have high school or GED degree 
* Highest degree in the household is some college 
* Is not financially responsible for kids
* Retired 
* Between 70 and 74 years old
* Pre-boomer generation 
* Their level of education is some college 
* White, non-Hispanic 
* Female
* Household size is 2 
* Household income is between $30,000 and $39,999
* Windowed 
* Lives in the south

##### Cluster 8 
* Neutral  level of life satisfaction 
* Medium – low level of future optimism 
* Medium - low level of idea working hard today means future success
* Own their home
* Live with spouse/partner/significant other
* Has between $5,000 and $19,999 in savings 
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have some college  
* Highest degree in the household is some college 
* Is not financially responsible for kids
* Retired 
* Between 62 and 69 years old
* Boom generation 
* Their level of education is some college
* White, non-Hispanic 
* Male
* Household size is 2
* Household income is between $50,000 and $59,999
* Widowed
* Lives in the south 

There are three things that are consistent across all clusters:
* Live with spouse/partner/significant other
* Two earners in the household 
* Lives in the south 

### ANOVA and Post Hoc Testing
Next I performed an ANOVA on the FSscore and the cluster groups. I used an alpha of 0.05. 
Ho: all the clusters have the same FSscore. 
Ha: not all the clusters have the same FSscore. 

The ANOVA came back with the p-value of less than alpha so I rejected the null and assumed the FSscore are different. I then ran a Tukey HSD to identify which clusters were different. I found clusters 1, 3 and 7 were not different from each other; 2 and 5 were not different from each other, 6 and 8 were not different from each other, and 4 is different from all others. I then went back to the clusters to identify where they are the same. 

##### Cluster 1, 3 and 7 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Mostly rent (7 owns)
* Live with spouse/partner/significant other
* Mostly between 1,000 and 4,999 in savings (3 has 100 – 999)
* Two earners in the household
* Share financial decision making with another member of the household (7 has sole responsibility) 
* Parents degrees all vary 
* Mostly some college in the household (1 has bachelor’s)
* Mostly is not financially responsible for kids (3 is)
* Mostly employed part-time (7 is retired)
* Age ranges vary 
* Generations vary 
* Mostly they have some college (1 has bachelor’s degree)
* Mostly Black, non-Hispanic (7 is White, non-Hispanic)
* Mostly female (1 is male)
* Mostly 3 members in the household (7 has 2)
* Mostly income between 30,000 and 39,999 (1 has 75,000 – 99,000
* Marital status varies 
* Live in the south 

##### Clusters 2 and 5 
* Medium – high level of life satisfaction 
* Medium – high level of future optimism 
* Medium – high level of idea working hard today means future success 
* Own their home
* Live with spouse/partner/significant other 
* Have between $20,000 and $74,999 in savings account
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents have some college
* Highest degree in the household is a bachelor’s degree
* Kids vary 
* Employment varies 
* Age varies 
* Generations vary 
* Their level of education is a bachelor’s degree 
* White, non-Hispanic 
* Male
* Household size varies 
* Household income varies but both at least $75,000
* Lives in the south 

##### Clusters 6 and 8 
* Neutral or below level of life satisfaction 
* Neutral or below level of future optimism 
* Neutral or below level of idea working hard today means future success 
* 6 rent, 8 own
* Live with spouse/partner/significant other
* Savings varies 
* Two earners in the household 
* Share financial decision making with another member of the household
* Parents education levels vary 
* Highest level of education in household varies but no more than some college 
* Is not financially responsible for kids
* Employment varies (homemaker and retired)
* Age varies
* Generation varies 
* Level of education varies but no more than some college 
* Race varies
* Gender varies 
* Household size of 2
* Household income varies but all below 60,000
* Marital status varies 
* Lives in the south 

### FSscore and Cluster Analysis 
Next I wanted to look at the clusters and FSscores specifically so I created a boxplot of the FSscore for each cluster and looked at the means. 

FSscore and Cluster boxplot
![alt text](https://github.com/mcassimus1/Financial_Well-being/blob/master/FSscore%20and%20Cluster%20boxplot.png)

FSscore Mean
![alt text] (https://github.com/mcassimus1/Financial_Well-being/blob/master/FSscore%20Means.png)

Looking at the FSscore means I can see cluster 1, 3 and 7 all have means around 50. 5 and 2 have FSscore means around 55. Clusters 8 and 6 have means less close together at 41.85 and 44.25, and cluster 4 has a FSscore mean of 47.4. 

## Conclusion
After completing the analysis I found there are 8 natural clusters in the data. Some of the clusters do have different financial stability score and some do not. Grouping the clusters based on if their FSscore are different I found the following:

Clusters 6 and 8 
* Have the lowest life satisfaction, future optimism, and future success scores
* Don’t have kids
* Work part-time or retired 
* Have 2 members in the household 

Cluster 2 and 5 
* Have the largest amount in savings
* Have a bachelor’s degree 
* White, non-Hispanic 
* Male 
* Married 

When I compare these characteristics with the FSscore, clusters 2 and 5 have the highest FSscore while clusters 6 and 8 have the lowest. Clusters 1, 3 and 7’s mean FSscore is the same as overall FSscore mean. 
