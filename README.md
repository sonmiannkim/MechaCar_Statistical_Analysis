# MechaCar Statistical Analysis
  Hypothesis - Following independent variables has a significant impact on the mileage
  H0 : The slope of the linear model is zero, or m = 0
  Ha- Following independent variables have NOT significantly impacted the Independent Variable
  Ha : The slope of the linear model is not zero, or m ≠ 0
 
## Linear Regression to Predict MPG
We'll look at each independent variable to determine if there is a significant relationship with the dependent variable.
 - Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
	According to the result (see below table and graph), vehicle length and ground clearance are statistically unlikely to provide random amounts of variance to the linear model.
	However, the multiple linear regression model outperformed the simple linear regression. 
	According to the summary output (see below), the r-squared value shows 0.72 in our multiple linear regression model while the p-value remained significant.
		
-- Data between Dependent and Independent variables
![Correlation in data matrix](cor_matrix_rounded.PNG)
-- Graph Visualizing the Correlation between Dependent and Independent variables
![Correlation data plotting](cor_mtx_Rplot.png)
 
 - Is the slope of the linear model considered to be zero? Why or why not?
	The slope of our linear model is not zero, because the p-value of our linear regression analysis is 5.35e-11 which is much smaller than our assumed significance level of 0.05%.
 
 - Does this linear model predict the mpg of MechaCar prototypes effectively? Why or why not?
   From the linear regression model, the r-squared value is 0.72, which means that roughly 72% of the variability of our dependent variable is explained using this linear model.
   In addition, the p-value of our linear regression analysis is 5.35e-11, which is much smaller than our assumed significance level of 0.05%. 
   Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.
	
	
## Summary Statistics on Suspension Coils
	Current Manufacturing data do indeed meet the design specification for all manufacturing costs in total and each lot individually. Looking at the table below, the standard deviation over mean
	is very low, which indicates that the suspension coils are close to the mean, and very small variation.
-- Total Summary
![Total Summary](total_summary.PNG)
-- Lot Summary
![Lot Summary](lot_summary.PNG)

## T-Tests on Suspension Coils
- H0 : There is no statistical difference between the observed sample mean and its presumed population mean.
- Ha : There is a statistical difference between the observed sample mean and its presumed population mean.

-- all manufacturing lots against the population mean 1500 : 
| T-value  | df | p-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| -1.8931  | 149  | 0.06028  | true mean is not equal to 1500  | 1497.507 1500.053  | mean of x 1498.78  | 

-- p-value > 0.05 suggests that the two groups Weak evidence.	
-- A P value greater than 0.05 means that no effect was observed.


-- Lot 1, Lot 2, Lot 3 against the population mean generated :
--Lot 1
| T-value  | df | P-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 0  | 49  | 1  | true mean is not equal to 1500  | 1499.719 1500.281 | mean of x 1500  | 

-- p-value = 1 suggests that the two groups are identical, therefore	
-- A P value equals 1 suggests there there is no difference between sample and population other than due to chance.

--Lot 2
| T-value  | df | P-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 0.51745  | 49  | 0.6072  | true mean is not equal to 1500  | 1499.423 1500.977 | mean of x 1500.2 | 

-- p-value greater than 0.1 means there is very little or no evidence therefore 	
-- A P value equals 0.6 suggests there there is no difference between sample and population other than due to chance.

--Lot 3
| T-value  | df | P-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| -2.0916  | 49  | 0.04168  | true mean is not equal to 1500  | 1492.431 1499.849 | mean of x 1496.14  | 


-- p-value less than 0.05 means there is an evidence that they can be significantly (statistically) different therefore 	
-- A P value equals 0.04 suggests there there is a difference between sample and population other than due to chance.

## Study Design: MechaCar vs Competition (Sample)
	The basic idea behind a Sample paired T-Test is to use statistics to evaluate two contrary hypotheses using two different samples:
	The Two-Sample t-test, or student's test, compares the mean of a vector against a theoretical mean between those two sampls.
	H0: Null hypothesis: The average is the same as the sample used.
	H2: True hypothesis: The average is different from the sample used.
	
	#### Test Plan
	- To create a randomized vector, a function called rnorm() is used.
	- Mean and standard deviation of MechaCar are used.	
	- Two 30 observations were assigned.
	- Close mean of +100 / -100 will be used with the same standard devisation as population mean
	
	Note: A t-test looks at the t-statistic, and the t-distribution values to determine the statistical significance.  Below is the test result:

	- Paired T-Test Result:
	The Paired T-test, or dependent sample t-test, is used when the mean of the treated group is computed twice.
	
	- To create a randomized vector, a function call rnorm() is used.
	- Mean of MechaCar + 100 / - 100 is used and the same standard deviation is used.	
	- Each sample - 30 observations were assigned.
	
	#### First Paired T-Test Result:

	| T-value  | df | P-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
	| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
	| -962.71  | 57.818  | p-value < 2.2e-16  | true mean is not equal to 1500  |  -105.42070  -98.75794 | mean of x mean of y 1399.453  1501.542   | 
	
	#### Second Paired T-Test Result:

	| T-value  | df | P-value | Alternative hypothesis | 95 percent confidence interval | sample estimates |
	| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
	|  -731.43  | 55.665  | p-value < 2.2e-16  | true mean is not equal to 1500  | 93.41752 101.10218 | mean of x mean of y 1598.802  1501.542   | 
	
	
	-- With p-value of  2.2e-16, we can conclude the averages of the two sample groups are significantly different the populating mean therefore, 
	-- We can state that there is no sufficient evidence to reject our null hypothesis.
	
