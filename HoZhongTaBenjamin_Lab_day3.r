setwd("D:\NUS Statistic Bootcamp\Stats Bootcamp Day 3 Materials\Day 3 workshop")

sensor<- read.csv("sensor.csv")

head(sensor)
# code design_typ as factor (optional if column is already a string)
sensor$sensor <- factor(sensor$sensor)

#Assumption for ANOVA
# Randomness and independence
# Normality
# Homogeneity of variance

# test for homogenity using levene's test
install.packages("car")
library(car)
levenetest(time ~ sensor, data = sensor) # not able to run 

# Hypothesis:
# H0: there are no difference between sensor
# H1: at least 1 pair is different
# Significant level of 0.05

# Question A

# check averages by group (can also be done using dplyr::group_b? option)
tapply(sensor$time, sensor$sensor, mean)

# using mean, sensor 1,2 and 3 has higher time taken than the rest, with 3 as highest
# while 4 has the lowest. We should expect a significant difference from these sensors

# create a box plot to assess visually
boxplot(sensor$time ~ sensor$sensor, ylim = c(100,250))
# Similar observations as mean, except that it can be illustrated that sensor 4 has the lowest spread and lowest time taken.

------
# Question B

# perform a one-way ANOVA, since boxplot suggests some heterogeneity
anova.result <- aov(time ~ sensor, data = sensor)

# check summary of the test results
summary(anova.result)

# p-value = 6.02e-05 
# As p-value is lower than the significant level of 0.05, reject H0 and accept H1.

--------
# Question C
# as results suggest, at least one of the classes is significantly different
# a Tukey test should be performed next to identify the specific groups/categories
TukeyHSD(anova.result)

# From the result of the Tukey-kramer, it can be shown that sensor 4 has p-values of below 0.05 for all 3 sensors.
# It can be concluded that occurrence 4-1, 4-2, 4-3 and 5-3 is significantly different.
# Sensor 4 is significantly different as compared to sensor 1, 2 and 3, the difference between sensor 5 and 3 is significantly different as well.
# Since sensor 4 is more significantly different as compared to sensor 5 and 3, it can be concluded that Sensor 4 is significantly different
# from the rest.

---------
# Question D
# The distinguishing features of the sensor with the quickest reaction time is a pure hardware system with no software components