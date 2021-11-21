#############################################################
#### Slide 17: sampling

students= c(21, 23, 24, 19, 25, 35, 29, 31, 34, 26, 23, 25, 29, 27, 28, 23, 33, 31, 21, 20)
mean(students)

# Conifdence Interval (4 numbers)
s4 = c(21, 26, 28, 20)
mean(s4)

# Slide#22
# Conifdence Interval (8 numbers)
s8 = c(23, 25, 29, 26, 25, 28, 33, 20)
mean(s8)

#### Slide 19 standard error of the mean (SEM)
# assume we dont know sigma
# sd() = function for standard deviation
SEM_s4 = sd(s4)/sqrt(4)
print(SEM_s4)

SEM_s8 = sd(s8)/sqrt(8)
print(SEM_s8)



