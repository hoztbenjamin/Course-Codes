# Steps to solve the problem (Regression)
# 1. read in the data

df <- read.csv("salary.csv", stringsAsFactors = TRUE)

# 2. Data exploration
summary(df)

# 3. Run the regression
attach(df)
res01 <- lm(salary ~ age + sex, data = df)
summary(res01)

df$sex <- relevel(df$sex, ref= "M")
res02 <- lm(salary ~ age + sex, data = df)
summary(res02)
