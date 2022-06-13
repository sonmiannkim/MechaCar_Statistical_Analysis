library("tidyverse")
library("dplyr")
library("corrplot")

#Delivery 1 - Analysis and linear regression model

meCar <- read.csv("MechaCar_mpg.csv")

# Scatterplot matrix
meCar %>%
  cor() %>%
  round(2) %>%
  print()

# Visualize correlation matrix with corrplot()
meCar %>%
  cor() %>%
  corrplot(
    type = "upper",
    diag = F, 
    order = "original",
    tl.col = "black",
    tl.srt = 45
  )

#meCar matrix
meCar_matrix <- as.matrix(meCar[,c("vehicle_length","vehicle_weight","spoiler_angle", "ground_clearance", "AWD", "mpg")])
#corelaton on all columes
cor(meCar_matrix)

#generate multiple linear regression model
mylm <-lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=meCar)
#generate summary statistics
summary(mylm)

#Show coefficients
mylm$coeff

#Show confident interval
confint(mylm, level = 0.95)


#Delivery 2 - mean, median, variance, and standard deviation

meSuspension <- read.csv("Suspension_Coil.csv")
summary(meSuspension)

#get the mean, median, variance, and standard deviation of the suspension coil’s PSI

test_summary <- summarize(meSuspension,mean(PSI,na.rm=TRUE))

#get total_summary
total_summary <- meSuspension %>%
  summarize(Mean = mean(PSI),
            Median = median(PSI),
            Variance = var(PSI),
            SD = sd(PSI))


total_summary

#get lot_summary
lot_summary <- meSuspension %>%
  group_by(Manufacturing_Lot) %>%
  summarize(Mean = round(mean(PSI, na.rm=TRUE), 3),
            Median = median(PSI, na.rm=TRUE),
            Variance = var(PSI, na.rm=TRUE),
            SD = sd(PSI, na.rm=TRUE))


lot_summary

#Delivery 3 - T-Tests

#all manufacturing lots against the population mean 1500
t.test(meSuspension$PSI, mean=1500)

#three t-tests that compare each manufacturing lot against the population mean 1500
lapply(split(meSuspension, factor(meSuspension$Manufacturing_Lot)), 
       function(x)t.test(data=x, x$PSI, mean=1500, paired=FALSE))


#Deliverable 4 - Design a statistical study to compare performance of the MechaCar
#One Sample test
set.seed(300) 

test_sample <- rnorm(30, mean = mean(meSuspension$PSI), sd = sd(meSuspension$PSI))
t.test(test_sample)

#Two Same test
test_sample_lower <- rnorm(30, mean = (mean(meSuspension$PSI) - 100), sd = sd(meSuspension$PSI))

test_sample_higher <- rnorm(30, mean = (mean(meSuspension$PSI) + 100), sd = sd(meSuspension$PSI))

t.test(test_sample_lower,test_sample_higher)

