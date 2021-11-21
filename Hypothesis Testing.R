setwd("C://1 Course/SB-SFB/Day 3 Lab Upload")
# McDonald's test (single variable x)
df <- read.csv("mcd.txt", header= TRUE)
t.test(df$times, alternative = 'less', mu=174.22)

# Telco's test (2 variable x with equal/ unequal variance)
df <- read.table("telco.txt", sep="\t", header= TRUE)
t.test(df$co1, df$co2, var.equal = FALSE)

t.test(df$co1, df$co2, var.equal = TRUE)

df <- read.table("paired.txt", sep="\t", header= TRUE)
t.test(df$mu1, df$mu2, paired = TRUE)

#t.test(df$mu1, df$mu2, paired = TRUE, alternative = "g")
prop.test(20408,39615, p=0.8, alternative='less')
