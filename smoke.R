#In the built-in data set survey, the Smoke column #records the students smoking habit,
#while the Exer column records their exercise level. 
#The allowed #values in Smoke are "Heavy", "Regul" (regularly), #"Occas" (occasionally) and "Never". 

#As for Exe?, #they are "Freq" (frequently), "Some" and "None".

#We can tally the students smoking habit against the #exercise level with the table function in R. 
$The #result is called the contingency table of the two #variables.

library(MASS)       # load the MAS? package 
tbl = table(survey$Smoke, survey$Exer) 
tbl
chisq.test(tbl)
# e do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.