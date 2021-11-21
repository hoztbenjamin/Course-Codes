# Day 1 Lab

# Exercise-1 Level-1
#1. Create a vector of integers 1 to 10. Print the data from position 3 to 7.

a = seq(1,10)
a
a[3:7]


#2. From the above filter out all the even numbers. 
a = seq(1,10)
x = a[-(a[a = ((a %% 2) == 0)])]
x

subset(a, [a !=?((a %% 2) == 0)])
lapply(a, evenFilter)
a


#3. Create a vector of odd integers from 1 to 20
s = seq (1,20, by =2 )
s
                                                
#4. Create a vector of numbers from 1 to 50 with a separation of 1.5 units.E.g .: 1.0, 2.?, 4.0, 5.5, .
x = (seq(1,50, by = 1.5))
x


#5. Create 2 vectors of integers 1 to 5 each and merge them into one single vector. Does this remove duplicates?
a = seq(1,5)
b = seq(1,5)

z = c(a,b)
z
# does not remove duplicates

-------------------------

# ?xercise-2 Level-1
# 1. How is a list different from an atomic vector?
# A list is heterogenous in nature, an atomic vector is homogenous in nature. 
# It means that a list can contain multiple data types while an atomic vector can only contain one data typ?.

--------------------------  
  
# Exercise-3 Level-1
# 1.How to convert a row vector of 1:10 to matrix mat shown in the figure ?
x = c(1:10)
x = matrix(x, nrow = 2, ncol = 5)
x

# 2.x = list(1:10). How to convert it to matrix mat shown in figure?
y = li?t(1:10)
y = as.numeric(unlist(y))
y = matrix(y, nrow = 2, ncol = 5)
y

# 3.How do you transpose matrix mat create in question 2?
z = t(y)
z

------------------------------------
# Exercise-4 Level-1
# 2.Change the column student_id as row names in class_mo?ified Remove student_id from the columns later
student_id = 101:105
age = sample(15:20, replace = TRUE, size = 5)
gender = sample(c("M","F"), 5, replace = TRUE, prob = c(0.6,0.4))
class_data = data.frame(student_id, gender , age)
new_student = list(106,'F'?18)
class_data = rbind(class_data, new_student)


class_additional_info = data.frame(student_id = 101:106,
                                   nationality = 
                                  sample(c("Asian","European","Japanese"),
                        ?         size = 6,
                                  replace = TRUE),
                                   stringsAsFactors = F)

class_modified = merge(class_data, class_additional_info, by='student_id')
class_modified

y = t(class_modified)
y
# 3.Subset ro?s 1 3 4 and columns 1 and 3 in class_modified
z = y[c(1,3:4), c(1,3)]
z


# 4.Count the number of males and females in class_modified Hint ::?

class_modified$gender = as.factor(class_modified$gender)
table(class_modified$gender)
# male = 4, female = 2

--?---------------
  
# Exercise-5 Level-1

vars = c('year', 'month','carrier','airport')
df = read.csv('airline_delay_causes_data.csv')%>%
    select(ends_with('ct'),vars)
df
# Total column = 9


---------------------
  
# Exercise-6 Level-1
# Convert the gi?en vector of sizes to an ordered factor, 
#  say size_ordered with levels S L XL Where X stands for extra size_vec = c("small", small"," large",large"," small","
  
size_vec = c("small","small","large","small","large")
     
size_ordered = factor(size_vec,?levels = c('small','large','extra'), ordered = T)

size_ordered = revalue(size_ordered, c("small" = 'S', large = 'L', extra = 'XL'))
                    
levels(size_ordered)

---------------------

# Exercise-7 Level-1
dat = data.frame (x= c(1,2),y=c(3,4)? z=c(5,6))
dat
apply(dat[,c('x','z')], 1, function(x)sum(x))

# Output is 6 and 8. The first number is sum of the 'x' and 'z' column on row 1 while the second number is the sum of the 'x' and 'z' column on row 2.