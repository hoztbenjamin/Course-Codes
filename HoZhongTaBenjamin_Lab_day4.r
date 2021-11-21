
install.packages("car")
library(car)
install.packages("lm.beta")
library(lm.beta)

#----- OilPrediction-----

OilPredict <- read.csv(file='OilPrediction.csv')
head(OilPredict)
attach(OilPredict)
OilPredict

OilPredictFit <- lm(Oil ~ Temp + Insulation)
vif(OilPredictFit)
OPBeta = lm.beta(OilPredictFit)
summary(OPBeta)
# p-value < 0.05

fitted(OilPredictFit)
residuals(OilPredictFit)
plot(OilPredictFit)

shapiro.test(res)
res
newdata<- data.frame(Temp = 15, Insulation = 10)
predict(OilPredictFit, newdata)

# Q1 
# Higher temp and higher insulation leads to lower Oil consumption


# Q2 What could a home owner expect heating oil consumption (in gallons) to be 
# if the outside temperature is 15 oF when the attic insulation is 10 inches thick?

# ------Starbucks------ 
# 

SB <- read.csv(file='StarbucksPrepaid.csv')
attach(SB)
SB
SB <- lm(Amount ~ Age + Income + Days + Cups)
vif(SB)
OPBeta = lm.beta(SB)
summary(OPBeta)

# The overall model has p-value < 0.05, thus significant
# Adjusted R2 of 0.7056 states that all the variable accounts for 70.56% of variance in the data, and since it is > 70%, the model is a good fit
# Only income's p-value < 0.05, thus significant. 
# Income is the only promising variable to be used for prediction


fitted(SB)
residuals(SB)
plot(SB)
shapiro.test(res)

# From the plot, it can be illustrated that there is a positive correlation between Income and Amount of prepaid card topped up.
# Thus, increased income of an individual will mean that they might top up more amount in the prepaid. 
# There should be increased sales and marketing focus on individuals with higher income

# --------
# Q2
SB <- lm(Days ~ Age + Income + Cups)
vif(SB)
OPBeta = lm.beta(SB)
summary(OPBeta)

# The overall model has p-value < 0.05, thus significant
# Adjusted R2 of 0.3324 states that all the variable accounts for 33.24% of variance in the data
# Since Adjusted R2 < 70%, the model is not a good fit and thus not very strong.

# Based on the model, only Cup's p-value < 0.05, thus significant. 
# The number of cups of coffee per day seems to have the most promise in predicting how many days per month spent.
# However, this variable does not provide any important insights as it is alreadyevident that the higher the daily coffee intake, 
# there will be more visits per month 
# Furthermore, given that the model is a weak fit, this insight is not recommended to be used for any marketing or sales focus.


# -------
# Q3

SB <- read.csv(file='StarbucksGrowth.csv')
attach(SB)
SB
SB <- lm(Revenue ~ Drinks + Stores + AveWeekEarnings)
vif(SB)

OPBeta = lm.beta(SB)
summary(OPBeta)

# After running the vif() function, it can be noted that the VIF of all three variables are above 10
# Thus, regression coefficients are poorly estimated due to Multicollinearity.

# To proceed and improve the model, the variable with the highest VIF, AveWeekEarnings, is removed
SB <- lm(Revenue ~ Drinks + Stores)
vif(SB)

# The resulting vif is below 10 but above 5 which indicates high correlation that maybe problematic.
# However, for this study, these will be used to create the regression model.

OPBeta = lm.beta(SB)
summary(OPBeta)

# The overall model has p-value < 0.05, thus significant
# Adjusted R2 of 0.979 states that all the variable accounts for 97.90% of variance in the data
# and since it is > 70%, the model is a good fit based on R2
# However, the high R2 value might be caused by high correlation between the independent variables.
# There is a direct correlation between having more number of stores and selling more drinks.

# Based on the model, both drinks and stores have p-value < 0.05, thus significant. 
# Both the number of drinks sold and number of stores are key predictors of sales revenue

fitted(SB)
residuals(SB)
plot(SB)
shapiro.test(res)

# The plot shows a positive correlation between drinks and store on sales revenue.
# This means that the number of number of stores and drinks will lead to increase in sales revenue

# However, based on the possible high correlation between the predictors, the model is considered weak. 
# Furthermore, the insight is not very helpful as it is a known that fact more stores and drinks will increase sales revenue as 
# more drinks will be sold. 
# Concluding, this analysis is not helpful in attempting to determine what drives sales revenues.

#------
