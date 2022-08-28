# Applied Statistics Final Assessment Assignemnt

A dataset which consists of records on short-term property rentals for entire homes is given for analysis. SAS studio software was used to deploy statistical modelling techniques on the dataset. A detailed report of the analysis and resutls was produced. 

The following table gives a description of the variables in the dataset.
![image](https://user-images.githubusercontent.com/69787181/179919658-c3f8ecda-0f6c-4722-ba4c-3f3d8535de3a.png)

**[Full Report](https://github.com/Alicia2203/Statistical-Analysis-on-Short-term-Property-dataset/blob/main/20074290_STATS_Final_Assess_Report.pdf)**

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






