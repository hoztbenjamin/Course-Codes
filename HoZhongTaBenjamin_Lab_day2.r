t = read.csv('titanic3.csv', stringsAsFactors=FALSE)

# factorizing the categorical variables
t$pclass = factor(t$pclass)
t$survived = factor(t$survived)
t$gender = factor(t$sex)

head(t)
t#boat

# question 1
ggplot(t, aes(x=age, fill=survived))+
  geom_histogram(color="black") + 
  theme_bw(base_family = 'Times') + 
  labs(x='Age', y='Survived', 
       title='Survival by Age, Class and Gender',
       color='Survived') +
  facet_grid(gender ~ pclass, scales = "free") +
  xlim(0,75)

# 3 Observations
# 1. There were more survivors in Class 1 as compared to the rest of the class
# 2. Overall, there were more female survivors as compared to males
# 3. The highest proportion of casualties are found in the class 2 male

------
  
# question 2

ggplot(t, aes(x=age, fill=survived)) +
  geom_histogram(color="black") +
  theme(legend.position = "right") +
  labs(x="age", y="Survived", title="Survival by Age and Gender") +
  facet_grid(~gender)
             

ggplot(t, aes(x=age, fill=survived)) +
  geom_histogram() +
  theme(legend.position="top") +
  geom_vline(xintercept = 12,size=0.,color='darkblue') +
  labs(title='Children Survival [cut:12yrs]') +
  facet_grid(~gender) +
  xlim(0, 30)

# Using the Survival by age and gender histogram, it can be shown that there are more female survivors as compared to male. 
# The Children Survival histogram focuses passengers aged 30 and below, with a cut at 12 year old mark to distinguish between children (12 years and below)
# and adults. The historgram for male illustrates a clear distinction in casualty proportion, with majority of adult male proportion as casuality
# as compared to children. However, the distinction for female children is not as defined, which is most likely due to the fact that females as a whole
# are evacuated first, regardless of age, contributing to the higher survival rates as compared to adult males. 
# Summarising, there were ample evidence to prove that women were evacuated first based on the overall casuality rates by gender, and there 
# were ample evidence to prove that children were evacuated first based on the difference in survival proportion when compared with the adult male survival rates.
--------




ggplot(t, aes(x=gender, fill=survived))+
  geom_bar() +
  theme(legend.position="top") +  labs(x = "Passenger Class)", 
                                       y = "Count", 
                                       title = "Passenger Distribution by Pclass & Gender") +
  facet_grid(~pclass) 



ggplot(t, aes(x=age, fill=survived))+
  geom_histogram() +
  theme(legend.position="top") +
  geom_vline(xintercept = 12,size=0.,color='darkblue') +
  labs(title='Passengers Survival [cut:12yrs]') +
  xlim(0, 18)


ggplot(t, aes(x=age, fill=survived))+
  geom_histogram() +
  theme(legend.position="top") +
  geom_vline(xintercept = 12,size=0.,color='darkblue') +
  labs(title='Passengers Survival [cut:12yrs]')+
  facet_grid(~gender) 

ggplot(t, aes(x=parch, fill=survived))+
  geom_bar() +
  theme(legend.position="top") +  labs(x = "Passenger Class)", 
                                       y = "Count", 
                                       title = "Passenger Distribution by Pclass & Gender") +
  facet_grid(~pclass) +
  xlim(1,9)
