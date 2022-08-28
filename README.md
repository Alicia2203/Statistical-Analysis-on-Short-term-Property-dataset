# Statistical Analysis on Short-term Property Dataset

A dataset which consists of records on short-term property rentals for entire homes is given for analysis. SAS studio software was used to deploy statistical modelling techniques on the dataset. A detailed report of the analysis and resutls was produced. 

The following table gives a description of the variables in the dataset.
![image](https://user-images.githubusercontent.com/69787181/179919658-c3f8ecda-0f6c-4722-ba4c-3f3d8535de3a.png)

# Analysis Report
**[Full Report in PDF File](https://github.com/Alicia2203/Statistical-Analysis-on-Short-term-Property-dataset/blob/main/20074290_STATS_Final_Assess_Report.pdf)**

## Table of Contents

1.0 Introduction 

2.0 Descriptive Analysis And Data Pre-processing 
_2.1 Observe Variables Metadata_
_2.2 Convert Categorical Variable bathroom\_text to Numerical Variable_
_2.3 Generate Frequency Table for Categorical Variables_
_2.4 Convert Categorical Variable host\_response\_time to Numerical Variable_
_2.5 Summary Statistics of Numeric Variables_
_2.6 Distribution plot and box plot_

3.0 Statistical Modelling and Analysis 
_3.1 Linear Regression: Explanatory Analysis on the Price of Property Rentals_
3.1.1 Scatter Plot Matrix 
3.1.2 Model selection 
3.1.3 Linear Regression Analysis 
3.3.4 Regression Diagnostic 

_3.2 Logistic Regression: Explanatory Analysis on host\_is\_superhost _
3.2.1 Bivariate Analysis 
3.2.2 Logistic Regression Analysis 

_3.3 ANOVA: Compare the means of review\_scores\_communication with different host\_response\_time\_num _
3.3.1 Descriptive Statistics Across Groups with Box and Whiskers Plot 
3.3.2 Analysis of Variance (ANOVA) 

4.0 Conclusion 

5.0 Appendix 

## Introduction

For this project, a data set containing the records on short-terms property rentals for entire homes was given for critical analysis. As a basic overview, the given dataset has 30 columns and 2095 rows of data regarding information on host details, property details, property reviews information and reviews scores. Among the 30 columns, there are 4 nominal, 2 ordinal, 14 discrete, 8 continuous variables and 2 additional observation identifiers (id, host_id). The nominal variables are host_is_superhost, host_has_profile_pic, host_identified_verified and property_type; the ordinal variable are host_response_time and bathrooms_text; the discrete variables are host_since, host_listings_count, accommodates, bedrooms, beds, minimum_nights, maximum_nights, availability_30, availability_60, availability_90, availability_365, number_of_reviews, number_of_reviews_ltm and number_of_reviews_130d; the continuous variables are price, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_communication, review_scores_location, review_scores_value and review_per_month.  

The analysis objectives of this project are to as follow:  
1. To estimate the relationship between the daily price of property rentals (price) and other variables related to property details and review scores in this dataset.
2. To estimate the relationship between host_is_superhost and other variables related to the host details and review scores predictors.
3. To test whether the ratings score for ease of communication (review_scores_communication) is affected by the host’s response time (host_response_time_num).  

To achieve objective 1, linear regression analysis will be conducted as the response variable (price) is a numerical variable. To achieve objective 2, binary logistic regression analysis will be performed as the response variable (host_is_superhost) is a categorical variable. To reach objective 3, analysis of variance (ANOVA) will be conducted to test the relationship between the categorical variable (host_response_time_num) and numeric variable (review_scores_communication) by testing the difference between the population means of review_scores_communication grouped by host_response_time_num. SAS Studio is used as the SAS programming interface to perform analysis on our data set for this project.  

## Descriptive Analysis And Data Pre-processing
Before performing statistical modelling and analysis, descriptive analysis techniques are deployed to summarize and explore the behaviour of the data involved in the study. Statistical techniques such as frequency distribution, measures of central tendency and measures of dispersion were used. Furthermore, distribution plots and box plots are generated to visualize the distribution of values for numeric variables. Appropriate data pre-processing techniques were also deployed during the descriptive analysis procedure.  

### 2.1 Observe Variables Metadata
To get an overview of the data set, we first observed the PROC CONTENTS table that reports metadata about the variables of our dataset that was interpreted by SAS studio (see Figure 1).  

![image](https://user-images.githubusercontent.com/69787181/187075128-8cb4e10e-8df6-4713-834e-5b03ec3b7d8a.png)

### 2.2 Convert Categorical Variable bathroom_text to Numerical Variable

Upon observation of Figure 1, it is identified that it would be appropriate to clean and convert the categorical variable bathroom_text into a numerical variable for further analysis. Figure 2 shows observations value of the bathroom_text variable and a new variable named bathrooms that holds the converted numerical values of the bathroom_text variable.

![image](https://user-images.githubusercontent.com/69787181/187075163-a56978ca-b75e-41d2-bc76-ddcb49801cc3.png)

### 2.3 Generate Frequency Table for Categorical Variables. 

A frequency table is generated for each categorical variable, namely host_is_superhost, host_has_profile_pic, host_identified_verified and property_type (see Figure 3, 4, 5, 6 and 7).

![image](https://user-images.githubusercontent.com/69787181/187075174-3a5f4066-3d0c-4936-b186-c3f911b7afa5.png)

![image](https://user-images.githubusercontent.com/69787181/187075178-dbdfeed3-788b-44e2-a02f-1cf44875d910.png)

### 2.4 Convert Categorical Variable host_response_time to Numerical Variable
  
It is observed that the variable levels of the host_response_time variable can be sorted to a particular order with “within an hour” being the least response time and “a few days or more” being the longest response time. Therefore, the host_response_time variable is encoded into to numeric variables. The values “within an hour”, “within a few hour”, “within a day” and “a few days or more” are encoded to the numbers 1 to 4 respectively. The encoded variable is then assigned to a new variable named host_response_time_num (see Appendix Figure 4 for code).

### 2.5 Summary Statistics of Numeric Variables 

After pre-processing our data, the summary statistics for each numeric variables is generated. In Figure 8, the summary statistics table shows the basic statistical measures such as the mean, median, range, standard deviation, minimum, maximum, number of observations, and number of missing values of the variables. It is observed that there are quite a number of missing values for the variables bedrooms, beds, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_communication, review_scores_location, review_scores_value and review_per_month. By observing the mean, median, range, standard deviation, minimum and maximum statistics of the variables, we do not identify any data anomaly.  

![image](https://user-images.githubusercontent.com/69787181/187078482-39ba7e02-5760-4eb8-a522-aec6d147a19e.png)

### 2.6 Distribution plot and box plot

To visualize the distribution of values for each numeric value and detect outliers in our data, a distribution plot and box plot is generated for each numeric variable (see Figure 9). By observing the boxplots, it is apparent that all variables excluding the variables availability_30, availability_60, availability_90, availability_365, have some potential outliers. Therefore, the outliers have to be taken into considerations and further investigation on the outliers is needed to identify if the outliers are true outliers or outliers that is due to faulty data. Furthermore, it is observed that the variables host_listings_count, bathrooms, bedrooms, beds, price, minimum_nights, number_of_reviews, number_of_reviews_ltm, number_of_reviews_130d, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_communication, review_scores_location, review_scores_value and review_per_month have a highly skewed distribution.

![image](https://user-images.githubusercontent.com/69787181/187078497-2cd0f4a1-16e6-4d39-b6d3-836c82eec541.png)
![image](https://user-images.githubusercontent.com/69787181/187078506-14bb258d-6ef3-4433-9689-1cf04a8137ba.png)
![image](https://user-images.githubusercontent.com/69787181/187078517-3444efe2-4f53-42c0-b606-8410d8c2488a.png)
![image](https://user-images.githubusercontent.com/69787181/187078535-8e270803-cc2b-4ea5-bad1-48832b2910b7.png)
![image](https://user-images.githubusercontent.com/69787181/187078544-ffea98e5-29ab-4c5e-ae96-22ef7c39aa63.png)
![image](https://user-images.githubusercontent.com/69787181/187078552-7f323de4-5d34-4dee-aa42-6694a9684ea1.png)

## 3.0 Statistical Modelling and Analysis
After performing descriptive analysis on our data set, statistical modelling and analysis is conducted to meet the objectives of this study. The following content in this section will be divided into 3 parts for 3 different statistical techniques:  
1. Linear Regression: Explanatory Analysis on the Price of Property Rentals (price) and other variables related to property details and review scores  
2. Logistic Regression: Explanatory Analysis on host_is_superhost and other variables related to the host details and review scores predictors.  
3. ANOVA: Compare the means of review_scores_communication with different host_response_time_num

### 3.1 Linear Regression: Explanatory Analysis on the Price of Property Rentals
To achieve objective 1, linear regression analysis will be conducted as the response variable (price) is a numerical variable. This section will aim to estimate the relationship between price of property rentals and other potential variables that can predict the response variable such as host_listings_count, accommodates, bathrooms, bedrooms, beds, availability_30, availability_60, availability_90, availability_365, number_of_reviews_130d, reviews_scores_rating, review_scores_accuracy, review_scores_communication, review_scores_location, review_scores_value, number_of_reviews_ltm, minimum_nights, maximum_nights, host_response_time_num, reviews_per_month, number_of_reviews and review_scores_cleanliness.

#### 3.1.1 Scatter Plot Matrix
Before performing statistical modelling to investigate the relationship between price of property rentals and other variables, a scatter plot matrix is constructed to investigate the linear relationships between variables and to check for outliers. As seen in Figure 10, the variable price and another 21 continuous variables are plotted against each other. It is observed that variables accommodates, bedrooms, bathrooms and bath are suggested to have a moderate linear correlation with price. Other variables such as host_listings_count, availability_30, availability_60, availability_90, availability_365, minimum_nights, maximum_nights, number_of_reviews_ltm, reviews_per_month, number_of_reviews_130d, reviews_scores_rating, review_scores_accuracy, review_scores_communication, review_scores_location, review_scores_value, number_of_reviews and review_scores_cleanliness do not seem to have a significant relation with price.

![image](https://user-images.githubusercontent.com/69787181/187078604-9614aee8-7c28-40d6-aeee-82e1bae9547e.png)

#### 3.1.2 Model selection
Model selection techniques is then deployed to select the most suitable variables for our model linear regression before constructing the model. The model selection procedure that are deployed are backward elimination and stepwise selection. As seen in Figure 11 and Figure 12, out of the 22 variables that are inputted into the linear regression model, only 14 variables are selected by the variables selection algorithm to be included into the model. The 14 variables that are suggested by both backward elimination and stepwise selection algorithm to be the most important variables to be included into the model to best fit the observed data are host_listings_count, accommodates, bathrooms, bedrooms, beds, availability_30, availability_60, availability_365, number_of_reviews_130d, reviews_scores_rating, review_scores_accuracy, review_scores_communication, review_scores_location and review_scores_value. The variables that are suggested to be removed from the linear regression model are number_of_reviews_ltm, minimum_nights, host_response_time_num, reviews_per_month, availability_90, number_of_reviews, maximum_nights and review_scores_cleanliness.

![image](https://user-images.githubusercontent.com/69787181/187078655-3bfd8dd3-e846-4134-9b4f-35c52625e577.png)
![image](https://user-images.githubusercontent.com/69787181/187078660-3520202b-fb66-4fbc-b402-b44d5418d4c3.png)

#### 3.1.3 Linear Regression Analysis
![image](https://user-images.githubusercontent.com/69787181/187078678-df6b9ab0-47d0-4c01-a2c5-afee0d9e3ce3.png)

The output result of the regression model in Figure 13 is interpreted and analyzed. It is observed that our model has an R-Square value 0.6320. Therefore, 63.2% of the variation in property rental price is explained by the variation in host_listings_count, accommodates, bathrooms, bedrooms, beds, availability_30, availability_60, availability_365, number_of_reviews_130d, reviews_scores_rating, review_scores_accuracy, review_scores_communication, review_scores_location and review_scores_value. The Adjusted R-Square value is 0.6291. Therefore, 62.91% of the variation in property rental price is explained by the regression model adjusted for the number of independent variables and sample size. The coefficient of variation is 47.71, which is considered not bad, this suggests a moderately good model fit. Furthermore, the variance inflation factors (VIF) value suggest that there is no collinearity problem for the model since none of the VIF values for the variables are larger than 10.  

The sample regression equation for the model is
![image](https://user-images.githubusercontent.com/69787181/187078738-ca28bb2b-3310-4702-a6c1-45b822ea3baa.png)

**_Inference on Collective Influence_**
𝐻0: There is no linear relationship between the response variable and the explanatory variables.
𝐻1: There is a linear relationship between the response variable and at least one of the explanatory variables.
To determine the collective influence of the explanatory variables in this dataset, it is required to perform an overall F-test for the hypothesis testing procedure. Based on Figure 13, the F-value is 215.76 and the corresponding p-value is <0.0001, therefore the null hypothesis is rejected at the 0.05 level of significance (𝛼 = 0.05). There is sufficient evidence to conclude that at least one of the explanatory variables has a significant effect on the response variable. Next, the test for the significance of the individual regression coefficients is conducted to determine which explanatory variables have a significant effect on the response variable.

**_Inference for Individual Regression Coefficients & Confidence Interval Estimate for the Slope_**

𝐻0:β1=0  
𝐻1:β1 ≠0 

where 𝛽1 is the partial regression coefficient for 𝑋1 (host_listings_count). The test statistic t-value for host_listings_count is -8.15 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that host_listings_count has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β1 is (-0.2083, -0.1275). We are 95% confident that for every unit increase in host_listings_count, the predicted property rental daily price is estimated to decrease between $0.1275 to $0.2083.  

𝐻0:β2 = 0   
𝐻1:β2 ≠ 0 

where 𝛽2 is the partial regression coefficient for 𝑋2 (accommodates). The test statistic t-value for accommodates is 4.35 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that accommodates has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β2 is (5.2025, 13.7543). We are 95% confident that for every unit increase in accommodates, the predicted property rental daily price is estimated to increase between $5.2025 to $13.7543.  

𝐻0:β3=0   
𝐻1:β3 ≠0  

where 𝛽3 is the partial regression coefficient for 𝑋3 (bathrooms). The test statistic t-value for bathrooms is 16.65 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that accommodates has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β3 is (81.0634, 102.7092). We are 95% confident that for every unit increase in bathrooms, the predicted property rental daily price is estimated to increase between $81.0634to $102.7092.  

𝐻0:β4=0   
𝐻1:β4 ≠0  

where 𝛽4 is the partial regression coefficient for 𝑋4 (bedrooms). The test statistic t-value for bedrooms is 3.45 with corresponding p-value 0.0006, which is larger than 0.0001, 𝐻0 is not rejected at significance level 𝛼 = 0.05. There is insufficient evidence to conclude that bedrooms have a significant relationship with price, controlling for the other variables.  

𝐻0:β5=0 
𝐻1:β5 ≠0

where 𝛽5 is the partial regression coefficient for 𝑋5 (beds). The test statistic t-value for beds is 3.47 with corresponding p-value 0.0006, which is larger than 0.0001, 𝐻0 is not rejected at significance level 𝛼 = 0.05. There is insufficient evidence to conclude that beds have a significant relationship with price, controlling for the other variables.  

𝐻0:β6=0 
𝐻1:β6 ≠0

where 𝛽6 is the partial regression coefficient for 𝑋6 (availability_30). The test statistic t-value for availability_30 is 5.52 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that availability_30 has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β6 is (2.823, 5.9304). We are 95% confident that for every unit increase in availability_30, the predicted property rental daily price is estimated to increase between $2.823 to $5.9304.  

𝐻0:β7=0   
𝐻1:β7 ≠0  

where 𝛽7 is the partial regression coefficient for 𝑋7 (availability_60). The test statistic t-value for availability_60 is -4.4 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that availability_60 has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β7 is (-2.6268, -1.008). We are 95% confident that for every unit increase in availability_60, the predicted property rental daily price is estimated to decrease between $1.008 to $2.6268.  

𝐻0:β8=0   
𝐻1:β8 ≠0  

where 𝛽8 is the partial regression coefficient for 𝑋8 (availability_365). The test statistic t-value for availability_365 is 6.01 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that availability_365 has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β8 is (0.1247, 0.2455). We are 95% confident that for every unit increase in availability_365, the predicted property rental daily price is estimated to increase between $0.1247 to $0.2455.  

𝐻0:β9=0    
𝐻1:β9 ≠0  

where 𝛽9 is the partial regression coefficient for 𝑋9 (number_of_reviews_l30d). The test statistic t-value for number_of_reviews_l30d is -3.97 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that number_of_reviews_l30d has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β9 is (-9.8218, -3.3282). We are 95% confident that for every unit increase in number_of_reviews_l30d, the predicted property rental daily price is estimated to decrease between $3.3282 to $9.8218.  

𝐻0:β10=0   
𝐻1:β10 ≠0  

where 𝛽10 is the partial regression coefficient for 𝑋10 (review_scores_rating). The test statistic t-value for review_scores_rating is 4.81 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that review_scores_rating has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β10 is (66.2314, 157.4406). We are 95% confident that for every unit increase in review_scores_rating, the predicted property rental daily price is estimated to increase between $66.2314 to $157.4406.  

𝐻0:β11=0  
𝐻1:β11 ≠0  

where 𝛽11 is the partial regression coefficient for 𝑋11 (review_scores_accuracy). The test statistic t-value for review_scores_accuracy is -2.77 with corresponding p-value 0.0057, which is larger than 0.0001, 𝐻0 is not rejected at significance level 𝛼 = 0.05. There is insufficient evidence to conclude that review_scores_accuracy has a significant relationship with price, controlling for the other variables.  

𝐻0:β12=0   
𝐻1:β12 ≠0  

where 𝛽12 is the partial regression coefficient for 𝑋12 (review_scores_communication). The test statistic t-value for review_scores_communication is -4.85 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that review_scores_communication has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β12 is (-106.783, -45.3133). We are 95% confident that for every unit increase in review_scores_communication, the predicted property rental daily price is estimated to decrease between $45.3133 to $106.783.  

𝐻0:β13=0   
𝐻1:β13 ≠0  

where 𝛽13 is the partial regression coefficient for 𝑋10 (review_scores_location). The test statistic t-value for review_scores_location is 9.55 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that review_scores_location has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β13 is (91.2376, 138.3913). We are 95% confident that for every unit increase in review_scores_location, the predicted property rental daily price is estimated to increase between $91.2376 to $138.3913.  

𝐻0:β14=0   
𝐻1:β14 ≠0  

where 𝛽14 is the partial regression coefficient for 𝑋14 (review_scores_value). The test statistic t-value for review_scores_value is -4.87 with corresponding p-value < 0.0001, 𝐻0 is rejected at significance level 𝛼 = 0.05. There is sufficient evidence to conclude that review_scores_value has a significant relationship with price, controlling for the other variables. Controlling for other explanatory variables in the model, the 95% confidence interval for β14 is (-139.0239, -59.1508). We are 95% confident that for every unit increase in review_scores_value, the predicted property rental daily price is estimated to decrease between $59.1508 to $139.0239.  

#### 3.3.4 Regression Diagnostic
To verify that our F-test and t-test in hypothesis testing for our linear regression model are reliable, it is necessary to deploy regression diagnostics to ensure that the standard regression assumptions are satisfied. Regression diagnostics plots such as the Normal Quantile-Quantile (Q-Q) Plot, Studentized Deleted Residuals (RStudent) plot, Cook’s Distance (Cook’s D) plot, Difference in Fit (DFFit) plot and Difference in Beta (DFBeta) plot is generated to check for the normality of the residuals as well as to identify high leverage points and outliers that are potential influential data.  

Based on the residuals against the normal quantiles (Q-Q) plot in Figure 14, it is observed that there is no serious violation of the normality assumption although there is a slight deviation at the tails of the data. Based on the kernel density plot in Figure 14, it is observed that the density curve is slightly skewed to the right, but it is not significant to the extent of violating the normality assumption. This conclusion is not contradicted by the quantile-quantile plot.  

![image](https://user-images.githubusercontent.com/69787181/187079904-f94025f6-d3cb-4f05-b5c6-dabf97e714ca.png)

To get a closer look of the RStudent Plot and Cook’s D plot in Figure 14, a larger version of the plot is generated in Figure 15. In addition to the RStudent Plot and Cook’s D plot, the DFFit Plot and DFBeta Plot are also generated to identify high leverage points and outliers that are potential influential data. In Figure 15, the RStudent plot shows a significant number of observations beyond two standard errors from the mean of 0. The Cook’s D plot and DFFit plot shows that there are several potential influential observations in the dataset, particularly observations #52053631, #50916991 and #47581743. To see which parameters these influential points might influence the most, the DFBeta plot is examined. Based on the DFBeta plot, observation #52053631is influential because of its effects on review_scores_communication, review_scores_accuracy and review_scores_rating; #50916991 is influential because of its effects on review_scores_location; observation #47581743 is influential because of its effects on bathrooms. These observations were analysed to ensure that they are not faulty data. After inspection of the suspicious influential points, no faulty data was found; therefore, no observations were removed.

![image](https://user-images.githubusercontent.com/69787181/187079924-1613d477-9079-4f66-8af4-20b10c686183.png)
![image](https://user-images.githubusercontent.com/69787181/187079934-b15e3709-9412-4f4e-b1f8-fc5f38dd32c1.png)

### 3.2 Logistic Regression: Explanatory Analysis on host_is_superhost
The second objective of our study is to estimate the relationship between host_is_superhost and other variables related to the host details and review scores predictors. As such, binary logistic regression analysis is performed with the variable host_is_superhost as the response variable and the variables host_since, host_response_time_num, host_listings_count, host_has_profile_pic, host_identity_verifi and review_scores_value as the predictor variables.

#### 3.2.1 Bivariate Analysis
Prior to moving on to the fully specified model, bivariate summaries of the host_is_superhost variable and the individual predictors are examined to understand the associations between them. Figure 16 shows a bar chart which compares host_is_superhost and host_response_time_num. It is observed that the value count true (t) is slightly higher then value count false (f) for variable host_is_superhost grouped by host_response_time_num. In Figure 17, the bar chart of host_is_superhost versus host_has_profile_pic shows that majority of the hosts has a profile picture and all host who is a superhost has a profile picture. Based on the bar chart of host_is_superhost versus host_identity_verified in Figure 18, it is observed that the value count false (f) is slightly higher then value count true (t) for variable host_is_superhost grouped by host_identity_verifi. Figure 19 illustrates a bar chart of host_is_superhost versus host_listing_count. It is observed that the majority of the hosts who are a superhost have relatively less property listing count whereas the majority of the hosts who are not a superhost host have relatively more property listing count. Figure 20 shows a histogram of host_is_superhost versus host_since. It is observed that the distribution of superhost-host count seems to peak higher than non-superhost-host when host_since is before 2017 whereas the count distribution of non-superhost-host seems to peak higher than superhost-host when host_since is after 2017. This suggest that a host is more likely to be a superhost when host_since is before 2017 and a host is more likely to not be a superhost when host_since is after 2017. This may also suggest that the earlier a host starts hosting, the larger the possibility that a host is a superhost.  

![image](https://user-images.githubusercontent.com/69787181/187079958-17a9dbdb-b6ac-4be6-a287-b02f1973e64b.png)
![image](https://user-images.githubusercontent.com/69787181/187079972-7492638a-85d2-48b2-a5a1-d65653cc94ed.png)

#### 3.2.2 Logistic Regression Analysis

Figure 21 provides information of the model, data set, the response variable, the number of response levels, the type of model, the algorithm used to obtain the parameter estimates, and the number of observations read and used in this model. Variable host_is_superhost has two response level, which are either true (t) or false (f), therefore the model is assumed to be “binary logit”.

![image](https://user-images.githubusercontent.com/69787181/187079999-8053a127-94a2-4b9c-bbe3-7ed97b73154d.png)
![image](https://user-images.githubusercontent.com/69787181/187080016-11c08d3e-bb80-45fa-9388-fec9e32bcc70.png)

The Model Fit Statistics table in Figure 22 provides three goodness-of-fit measures, namely Akaike’s Information Criterion (AIC) test, Schwarz criterion (SC) test and the -2LogL test. By comparing these test values for the “Intercept Only” column and the “Intercept and Covariates” column, we can observe that the “Intercept and Covariates” column has a smaller value, this imply that this logistic regression model is a good model to fit the data set.  

**_Inference on Collective Influence_ **  
![image](https://user-images.githubusercontent.com/69787181/187080047-f35c5e20-70bb-4484-9bae-2a235d193650.png)

Based on the output results of the Testing Global Null Hypothesis Table in Figure 22, 𝐻0 is rejected since the p-values for all three tests, namely the Likelihood ratio test, Score test and Wald test are <0.0001. At the 0.05 significance level, collectively the predictor variables are significant, indicating at least one of the predictors in the model is useful in predicting whether a host is a superhost.  

![image](https://user-images.githubusercontent.com/69787181/187080077-3e951ebd-dc7a-4ad4-82a5-785431a23892.png)

From the Analysis of Maximum Likelihood Estimates table in Figure 23, we obtain the parameter estimates of β0=−10.5013 , β1 =−0.00021, β2 =−1.2599, β3 =−0.0142 , β4 =−10.7784, β5 =−0.3387 and β6 =3.5449. Given that reference cell coding was used in this analysis, each effect is measured against the reference level.

![image](https://user-images.githubusercontent.com/69787181/187080095-6177f518-1281-4e72-a7cf-5fb7467be3d1.png)

**_Inference for Individual Regression Coefficients_**

Based on the Type 3 Analysis of Effect Table in Figure 23, let   
𝐻0:β1=0   
𝐻1:β1 ≠0  

where 𝛽1 is the partial regression coefficient for 𝑋ℎ𝑜𝑠𝑡_𝑠𝑖𝑛𝑐𝑒. The test statistic Wald Chi-Square for host_since is 10.8199 with corresponding p-value is 0.0010, which is > 0.0001, null hypothesis is not rejected at significance level 𝛼 = 0.05. host_since is not significant in predicting whether a host is a superhost, controlling for the other variables.  

𝐻0:β2=0   
𝐻1:β2 ≠0  

where 𝛽2 is the partial regression coefficient for 𝑋ℎ𝑜𝑠𝑡_𝑟𝑒𝑠𝑝𝑜𝑛𝑠𝑒_𝑡𝑖𝑚𝑒_𝑛𝑢𝑚.The test statistic Wald Chi-Square for host_response_time_num is 39.5837 with corresponding p-value < 0.0001, null hypothesis is rejected at significance level 𝛼 = 0.05. host_response_time_num is significant in predicting whether a host is a superhost, controlling for the other variables.  

𝐻0:β3=0   
𝐻1:β3 ≠0  

where 𝛽3 is the partial regression coefficient for 𝑋ℎ𝑜𝑠𝑡_𝑙𝑖𝑠𝑡𝑖𝑛𝑔_𝑐𝑜𝑢𝑛𝑡.The test statistic Wald Chi-Square for host_listing_count is 59.6846 with corresponding p-value < 0.0001, null hypothesis is rejected at significance level 𝛼 = 0.05. host_listing_count is significant in predicting whether a host is a superhost, controlling for the other variables.  

𝐻0:β4=0   
𝐻1:β4 ≠0  

where 𝛽4 is the partial regression coefficient for 𝑋ℎ𝑜𝑠𝑡_ℎ𝑎𝑠_𝑝𝑟𝑜𝑓𝑖𝑙𝑒_𝑝𝑖𝑐. The test statistic Wald Chi-Square for host_has_profile_pic is 0.0004 with corresponding p-value is 0.9832, which is > 0.0001, null hypothesis is not rejected at significance level 𝛼 = 0.05. host_has_profile_pic is not significant in predicting whether a host is a superhost, controlling for the other variables.  

𝐻0:β5=0   
𝐻1:β5 ≠0  

where 𝛽5 is the partial regression coefficient for 𝑋ℎ𝑜𝑠𝑡_𝑖𝑑𝑒𝑛𝑡𝑖𝑡𝑦_𝑣𝑒𝑟𝑖𝑓𝑖. The test statistic Wald Chi-Square for host_identity_verifi is 5.6249 with corresponding p-value is 0.0177, which is >0.0001, null hypothesis is not rejected at significance level 𝛼 = 0.05. host_identity_verifi is not significant in predicting whether a host is a superhost, controlling for the other variables.  

𝐻0:β6=0  
𝐻1:β6 ≠0  

where 𝛽6 is the partial regression coefficient for 𝑋𝑟𝑒𝑣𝑖𝑒𝑤_𝑠𝑐𝑜𝑟𝑒𝑠_𝑣𝑎𝑙𝑢𝑒𝑠. The test statistic Wald Chi-Square for review_scores_values is 124.6312 with corresponding p-value < 0.0001, null hypothesis is rejected at significance level 𝛼 = 0.05. review_scores_values is significant in predicting whether a host is a superhost, controlling for the other variables.  

![image](https://user-images.githubusercontent.com/69787181/187080181-95fc02c7-9243-461b-98df-c40ff3bc3fdc.png)

Based on the Association of Predicted Probabilities and Observed Responses Table in Figure 24, the c (concordance) statistics has a value of 0.809, indicating that 80.9% of the positive and negative response pairs (host_is_superhost) are correctly sorted using host_since, host_response_time_num, host_listing_count, host_has_profile_pic, host_identity_verifi and review_scores_values. This shows a strong ability for host_since, host_response_time_num, host_listing_count, host_has_profile_pic, host_identity_verifi or review_scores_values to discriminate between whether a host is a superhost.  

The Odds Ratios table in Figure 24 shows that a number of 10 increase in host_listing_count is associated with a (1-0.868)% = 13.2% decrease in the odds of a host being a superhost. This suggest that the larger the host_listing_count, the less likely a host is to be a superhost.

![image](https://user-images.githubusercontent.com/69787181/187080190-1efd99ad-406a-428d-8a41-edd92df3b55d.png)

Figure 25 shows the odds ratio plot for the Walk confidence limit of our mode. Based on the Odds Ratio Estimates table in Figure 24, for 95% confidence interval, we are confident that the true odds ratio of host_since falls between 1.000 and 1.000; the true odds ratio of host_response_time_num falls between 0.192 and 0.420; the true odds ratio of host_listings_count falls between 0.982 and 0.989; the true odds ratio of host_has_profile_pic falls between <0.001 and >999.999; the true odds ratio of host_identity_verifi falls between 0.539 and 0.943; the true odds ratio of review_scores_value falls between 18.589 and 64.538. In Figure 25, it is observed that the estimates of host_response_time_num, host_listings_count and host_identity_verifi are less then 1 whereas the estimates of review_scores_value is greater than 1. Both estimates of host_since and host_has_profile_pic intersect the reference line at odds ratio = 1, which indicates ratios that are not significantly different from 1, the effect of these two variables are not significant at the 0.05 significance level.  

![image](https://user-images.githubusercontent.com/69787181/187080215-9989af3b-e28c-46d9-9999-87fabb012a09.png)

The effects plot in Figure 26 shows the probability of whether a host is a superhost across all combinations of categories and levels of all three predictor variables. It is observed that the probability of host_is_superhost is true decreases with the increase in the year for host_since, therefore, this suggest that the earlier a host starts hosting, the larger the probability that a host is a superhost. Furthermore, this plot suggest that a host who has a profile pic and has identity verified have the highest probability to be a superhost. Following that, the condition for a host to have the second largest probability to be a superhost is to have a profile pic and host identified not verified. The condition of a host not having a profile pic but have identified verified and the condition of a host who neither has a profile pic nor have their identity verified has little to no probability of being a superhost.  

### 3.3 ANOVA: Compare the means of review_scores_communication with different host_response_time_num

Our third objective of this study is to test whether the ratings score for ease of communication (review_scores_communication) is affected by the host’s response time (host_response_time_num). To reach this objectve, analysis of variance (ANOVA) will be conducted to test the relationship between the categorical variable (host_response_time_num) and numeric variable (review_scores_communication) by testing the difference between the population means of review_scores_communication grouped by host_response_time_num.

#### 3.3.1 Descriptive Statistics Across Groups with Box and Whiskers Plot
![image](https://user-images.githubusercontent.com/69787181/187080248-fb14b987-0e56-43d7-a13b-5df42fa7b0f8.png)

Figure 27 shows the box and whiskers plot of the review_scores_communication grouped by host_response_time_num. By observing the plot, there is no significant difference between the boxes, all boxes are situated near the value 5 of review_scores_communication. It is suggested that the four host_response_time_num value may result in the same mean of the review_scores_communication. However, it is also observed that the values of review_scores_communication with the host_response_time_num = 1 are more scattered, ranging from the value 1 to 5 of review_scores_communication.

#### 3.3.2 Analysis of Variance (ANOVA)
![image](https://user-images.githubusercontent.com/69787181/187080278-06f2bf36-ed2d-40ca-9cfa-327e879df451.png)

![image](https://user-images.githubusercontent.com/69787181/187080284-abcc70ad-eb18-476e-9eb0-09997a3d2775.png)

Based on the analysis of variance table in Figure 28, the reported f-value is 0.77, and the corresponding p-value is 0.5090, which is greater than 0.05, therefore, we do not reject 𝐻0 at the 0.05 level of significance (𝛼 = 0.05). There is insufficient evidence to conclude that there is statistically significant difference between the means of review_scores_communication. The four different host_response_time_num value result in the same mean review_scores_communication. Furthermore, it is observed that the R-Square value of our model is 0.0012, therefore, host_response_time_num explains about 0.12% of the variability of review_scores_communication. The total mean of the review_scores_communication is 4.8407 and the Root mean square error (RMSE) is 0.0665.  

![image](https://user-images.githubusercontent.com/69787181/187080293-18bc8f04-e336-493b-8b40-e37f50fd7bbc.png)

Figure 29 shows the diffogram plot of review_scores_communication comparison for host_response_time_num. It is observed that all the confidence limit for the difference cross the diagonal equivalence line, therefore, there is no significant difference between host_response_time_num 1 to 4.  

## 4.0 Conclusion
In summary, the objectives of this study are to estimate the relationship between the daily price of property rentals and other variables related to property details and review scores; to estimate the relationship between host_is_superhost and other variables related to the host details and review scores predictors; and to test whether the ratings score for ease of communication is affected by the host’s response time. For the first objective, linear regression analysis was conducted and it was found that 63.2% of the variation in property rental price is explained by the variation in host_listings_count, accommodates, bathrooms, bedrooms, beds, availability_30, availability_60, availability_365, number_of_reviews_130d, reviews_scores_rating, review_scores_accuracy, review_scores_communication, review_scores_location and review_scores_value. Controlling for the other variables, the variables that has a significant relationship with price are host_listings_count, accommodates, bathrooms, availability_30, availability_60, availability_365, number_of_reviews_130d, reviews_scores_rating, review_scores_communication, review_scores_location and review_scores_value. For the second objective, logistic regression analysis was conducted and it was found that 80.9% of the positive and negative response pairs (host_is_superhost) are correctly sorted using host_since, host_response_time_num, host_listing_count, host_has_profile_pic, host_identity_verifi and review_scores_values. Controlling for the other variables, the variables that has a significant relationship with host_is_superhost are host_response_time_num, host_listings_count, and review_scores_value. For the third objective, analysis of variance (ANOVA) is performed and it is found that there is insufficient evidence to conclude that there is statistically significant difference between the means of review_scores_communication of different host_response_time_num. Therefore, the ratings score for ease of communication is not affected by the host’s response time.

## 5.0 Appendix
![image](https://user-images.githubusercontent.com/69787181/187080326-4a6cc223-00b8-4845-8680-bf160a42828e.png)
![image](https://user-images.githubusercontent.com/69787181/187080329-d886914e-966e-4621-886e-65f8f2337a88.png)
![image](https://user-images.githubusercontent.com/69787181/187080340-7a23e095-2d9e-44ee-a850-a6a5efff74c8.png)
![image](https://user-images.githubusercontent.com/69787181/187080346-d01198dd-6c83-4da1-b406-6a8b99fdf66d.png)
![image](https://user-images.githubusercontent.com/69787181/187080351-4322f365-ea44-4c82-9cdd-43ba9cb3c1b3.png)
![image](https://user-images.githubusercontent.com/69787181/187080356-d70af005-9f01-4c14-b7ec-ce2685093729.png)
![image](https://user-images.githubusercontent.com/69787181/187080362-1c1c1ea6-a324-4ac4-ba23-cd8ad1577172.png)


















