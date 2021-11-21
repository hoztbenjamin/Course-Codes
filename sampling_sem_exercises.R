
# Generate 1k random numbers with Mean=50 and SD=10
popn = rnorm(1000, 50, 10) 

# plot the histogram
hist(popn)

# Take a small sample (n) from popn1
n = 50
sample1 = sample(popn,n)

# calculate the SD of the sample1
sd(sample1)

#calculate the mean of sample1
mean(sample1)

# calcuate the Standard Error of the mean
SEM = sd(sample1)/sqrt(n)
print(paste("Std Error of the Mean:",SEM))

#try to change the value of n to 100 - what do you observe about SEM?

#############################################################
### this is the student example from earlier

students= c(21, 23, 24, 19, 25, 35, 29, 31, 34, 26, 23, 25, 29, 27, 28, 23, 33, 31, 21, 20)
mean(students)
# from the notes ...
s4 = c(21, 26, 28, 20)
s8 = c(23, 25, 29, 26, 25, 28, 33, 20 )
mean(s4)
sd(s4)/sqrt(4)
mean(s8)
sd(s8)/sqrt(8)

# suppose we want to draw the 4 and 8 randomly ...
# random sample of size=4
s4 = sample(students,4)
print(s4)
print(paste(mean(s4),'=',sd(s4)/sqrt(4)))

# random sample of size=8
s8 = sample(students,8)
print(s8)
print(paste(mean(s8),'=',sd(s8)/sqrt(8)))

# random sample of various sizes
for(i in c(4,8,12,16,20,40,100)){
  sample_i = sample(students,i,replace=T)
  v=round(sd(sample_i)/sqrt(i),3)
  print(paste(mean(sample_i), ':', v))
}

# try changing the last n from 100 to 10000!!!
# what do you observe?

##### Lets try another example using the popn from above
for(n in c(5,10,15,20,25,30, 60)) {
  # take a sample n from popn
  rand = sample(popn,n)
  # caculate the SEM
  se = sd(rand)/sqrt(n) 
  print(paste(n,se))
}

#############################################################
# We can also generate random numbers using Sample
# generate a sample of n=40 with values between 1:100
sample2 = sample(1:100, 40)

SEM2 = sd(sample2)/sqrt(length(sample2))

#############################################################
# sampling of non-numeric values
# Create a vector called myname
myname = c('C','H','A','R','L','E','S','P','A','N','G')

# Randomly select letters from the myname vector
sample(myname,5)

#############################################################
# What if we want to draw a small sample from a dataframe
# this can be useful if your df has 500k rows and you 
# just want a small sample to test out an algorithm

# first create a dataframe 100k x 50 to simulate your dataset
df = data.frame(matrix(rnorm(20), nrow=100000, ncol=50))
dim(df)

# take a small sample of 5k rows x 50 cols
sample= df[sample(nrow(df), 5000), ]
dim(sample)

# another example using mtcars dataset
attach(mtcars)

# take a sample of 5 rows
sample= mtcars[sample(nrow(mtcars), 5), ]
dim(sample)

#############################################################
# using the dplyr - not as clumsy as the df above
# since dplyr input is a dataframe
# you may have to install the dplyr library

library(dplyr)
#sample 5 rows
sample_n(mtcars, 5)
#sample 20%
sample_frac(mtcars,0.2)



