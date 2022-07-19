/* APLIED STATISTICS FINAL ASSESMENT */
/* STUDENT NAME: ALICIA CHONG TSUI YING */
/* STUDENT ID: 20074290 */

/* Accessing Data */
%LET inpath=/home/u49852218/STATS/Final_Assess/Input;
LIBNAME STATDATA "/home/u49852218/STATS/Final_Assess/Output";

proc import datafile= "&inpath/final-assess-data-mar22.csv"
			dbms= csv 
			out= STATDATA.PropertyImport 
			replace;
			guessingrows=max;
			GETNAMES=YES;
run;

/*Exploring data*/
proc contents data=STATDATA.PropertyImport varnum;
Run;

proc print data=STATDATA.PropertyImport (obs=5);
Run;

/*Data Cleaning*/
data STATDATA.PropertyCleaned;
	set STATDATA.PropertyImport;
	length property_type_num 3;
	
	*Extract numerical value from bathrooms_text char type variable;
	bathrooms = input(compress(bathrooms_text, '.', 'kd'), 8.);
		
	*Encode categorical variable host_response_time to numeric;
	if host_response_time = 'within an hour' then host_response_time = 1;
		else if host_response_time = 'within a few h' then host_response_time = 2;
		else if host_response_time = 'within a day' then host_response_time = 3;
		else if host_response_time = 'a few days or' then host_response_time = 4;
	
		host_response_time_num = input(host_response_time, 14.);
		drop host_response_time;
	
	if property_type = 'Tiny house' then property_type_num = 1;
		else if property_type = 'Entire bungalow' then property_type_num = 1;
		else if property_type = 'Entire guest suite' then property_type_num = 2;
		else if property_type = 'Entire guesthouse' then property_type_num = 2;
		else if property_type = 'Entire rental unit' then property_type_num = 2;
		else if property_type = 'Entire residential home' then property_type_num = 3;
		else if property_type = 'Entire cottage' then property_type_num = 3;
		else if property_type = 'Entire loft' then property_type_num = 3;
		else if property_type = 'Entire condominium (condo)' then property_type_num = 3;
		else if property_type = 'Entire place' then property_type_num = 3;
		else if property_type = 'Entire townhouse' then property_type_num = 3;
		else if property_type = 'Entire villa' then property_type_num = 4;
		else if property_type = 'Entire serviced apartment' then property_type_num = 5;
run;

/********************** DESCRIPTIVE ANALYSIS ********************************/

/* Frequency Table for categorical variables */
title 'Frequency Table for caategorical variable';
proc freq data=STATDATA.PropertyImport nlevels;
	tables host_is_superhost  host_identity_verified
		   host_response_time host_has_profile_pic
		   property_type / missing nocum;
run;
title;

/* Summary Statistics for Numeric variables*/
ods noproctitle;
ods graphics / imagemap=on;
proc means data=STATDATA.PropertyCleaned maxdec=2
				chartype mean median range std min max n nmiss vardef=df;
	var host_listings_count host_response_time_num accommodates  
		bathrooms bedrooms beds price minimum_nights
	    maximum_nights availability_30 availability_60 availability_90
		availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month;
title 'Summary Statistics for numeric variables'; 
run;


/* Univariate Analysis on numeric variables*/
proc univariate data=statdata.PropertyCleaned plot;
	title 'Univariate Analysis of each variable';
	var host_since host_listings_count accommodates bathrooms bedrooms  
		beds price minimum_nights host_response_time_num
	    maximum_nights availability_30 availability_60 availability_90
		availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month;
	id id;
run;

**********************************************************************************; 
************************** LINEAR REGRESSION *************************************; 
**********************************************************************************;                            

/* Scatter Plot Matrix 1*/
proc sgscatter data=STATDATA.PropertyCleaned;
			   matrix price accommodates bathrooms bedrooms beds;
run;

/* Scatter Plot Matrix 2*/
proc sgscatter data=STATDATA.PropertyCleaned;
			   matrix price host_listings_count availability_30
			   		  availability_60 availability_90 availability_365;
run;

/* Scatter Plot Matrix 3*/
proc sgscatter data=STATDATA.PropertyCleaned;
			   matrix price minimum_nights maximum_nights 
			 		  number_of_reviews number_of_reviews_ltm
		      		  number_of_reviews_l30d;
run;

/* Scatter Plot Matrix 4*/
proc sgscatter data=STATDATA.PropertyCleaned;
			   matrix price review_scores_rating review_scores_accuracy
			   		  review_scores_cleanliness review_scores_communication
			 		  review_scores_location review_scores_value reviews_per_month;
run;

/************************* Feature Selection *************************************/

/* Best 20 Models with Mallows C(p) */
ods graphics on;
proc reg data=STATDATA.PropertyCleaned plots=(criteria(label)cp)PLOTS(MAXPOINTS=none);
	model price = host_listings_count accommodates bathrooms bedrooms beds minimum_nights
	    maximum_nights availability_30 availability_60 availability_90
		availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month/ selection=cp best=20;
	title 'Property data: Best 20 models';
run;
ods graphics off;

/* Model Selection with Forward Selection */
ods graphics on;
proc reg data=STATDATA.PropertyCleaned PLOTS(MAXPOINTS=none);
	model price = host_listings_count accommodates bathrooms bedrooms beds minimum_nights
	    maximum_nights availability_30 availability_60 availability_90
		availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month / selection=forward;
	title 'Property data: Forward selection results'; 
run;
ods graphics off;

/* Model Selection with Backward Elimination*/
ods graphics on;
proc reg data=STATDATA.PropertyCleaned PLOTS(MAXPOINTS=none);
	model price = host_listings_count accommodates bathrooms bedrooms beds minimum_nights
	    host_response_time_num maximum_nights availability_30 availability_60 
	    availability_90 availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month/ selection=backward;
	title 'Property data: Backward elimination results'; 
run;
ods graphics off;

/* Model Selection with Stepwise Selection */
ods graphics on;
proc reg data=STATDATA.PropertyCleaned PLOTS(MAXPOINTS=none);
	model price = host_listings_count accommodates bathrooms bedrooms beds minimum_nights
	    host_response_time_num maximum_nights availability_30 availability_60 availability_90
		availability_365 number_of_reviews number_of_reviews_ltm
		number_of_reviews_l30d review_scores_rating review_scores_accuracy
		review_scores_cleanliness review_scores_communication
		review_scores_location review_scores_value reviews_per_month / selection=stepwise;
title 'Property data: Stepwise selection results'; 
run;
title;
ods graphics off;

/* Multiple Linear Regression Analysis (After model selection, left 14 predictors)*/
* removed minimum_nights, maximum_nights, availability_90, number_of_reviews
  review_scores_cleanliness, number_of_reviews_ltm, reviews_per_month, host_response_time_num ;
proc reg data=STATDATA.PropertyCleaned;
	title 'Linear Regression Analysis (Dependent Variable:Price)';	
		model price = host_listings_count accommodates bathrooms bedrooms beds 
	     	          availability_30 availability_60 availability_365  
		              number_of_reviews_l30d review_scores_rating 
		              review_scores_accuracy review_scores_communication 
		              review_scores_location review_scores_value / clb vif;
    id id;
run;

/************************* DIAGNOSTIC PLOTS  *************************************/
ods graphics on;
proc reg data = STATDATA.PropertyCleaned PLOTS(MAXPOINTS=none)
	plots(only label) = rstudentbypredicted
	plots(only label) = cooksd
	plots(only label) = dffits
	plots(only label) = dfbetas
;
model price = host_listings_count accommodates bathrooms bedrooms beds 
	     	  availability_30 availability_60 availability_365  
		      number_of_reviews_l30d review_scores_rating review_scores_accuracy
			  review_scores_communication review_scores_location 
			  review_scores_value;  
id id;
run;

/*  Print observations that has potential outliers  */
proc print data= STATDATA.PropertyCleaned noobs;
	where id = 52053631 or
		  id = 50916991 or 
		  id = 47581743;
run;

**********************************************************************************; 
************************** LOGISTIC REGRESSION ***********************************; 
**********************************************************************************; 

/* Bar Chart of host_is_superhost VS host_response_time_num */
proc sgplot data = STATDATA.PropertyCleaned;
	title 'Bar Chart of host_is_superhost VS host_response_time_num';	
  vbar host_response_time_num / group = host_is_superhost groupdisplay = cluster;
run;

/* Bar Chart host_is_superhost VS host_has_profile_pic*/
proc sgplot data = STATDATA.PropertyCleaned;
	title 'Bar Chart of host_is_superhost VS host_has_profile_pic';	
  vbar host_has_profile_pic / group = host_is_superhost groupdisplay = cluster;
run;

/* Bar Chart of host_is_superhost VS host_identity_verified*/
proc sgplot data = STATDATA.PropertyCleaned;
	title 'Bar Chart of host_is_superhost VS host_identity_verified';	
  vbar host_identity_verified / group = host_is_superhost groupdisplay = cluster;
run;

/* Bar Chart of host_is_superhost VS host_listings_count*/
proc sgplot data = STATDATA.PropertyCleaned;
	title 'Bar Chart of host_is_superhost VS host_listings_count';	
  vbar host_listings_count / group = host_is_superhost groupdisplay = cluster;
run;

/* Histrogram of host_since by host_is_superhost */
proc sgplot data=STATDATA.PropertyCleaned;
title "Histrogram of host_since by host_is_superhost";
  histogram host_since / group=host_is_superhost transparency=0.5;      
  density host_since / type=kernel group=host_is_superhost; 
run;

/*Multiple Logistic Regression*/
ods graphics on;
proc logistic data=STATDATA.PropertyCleaned 
	plots(only)=(oddsratio effect);
	class host_has_profile_pic 
		  host_identity_verified / param=ref;
	model host_is_superhost (event='t') = host_since  
										  host_response_time_num
										  host_listings_count 
										  host_has_profile_pic
										  host_identity_verified
										  review_scores_value
										  ;
	units host_listings_count = 10;
	title 'Logistic Regression Analysis (Dependent Variable: host_is_superhost)';
run;

**********************************************************************************; 
*********************************** ANOVA ****************************************; 
**********************************************************************************; 

/* ANOVA (review_scores_communication VS Host_response_time type)*/
ods graphics on;
proc glm data=STATDATA.PROPERTYCLEANED  plots=(residuals diagnostics);
title 'Analysis of Variance (Review_score_communication VS Host_response_time type)';
	class host_response_time_num;
	model review_scores_communication = host_response_time_num;
    lsmeans host_response_time_num / adjust = tukey;
	means host_response_time_num / hovtest =levene;
run;


