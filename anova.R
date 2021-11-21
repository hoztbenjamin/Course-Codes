setwd("C://1 Course/SB-SFB")

golf.ball <- read.csv("golfBall.csv")

head(golf.ball)
# code design_typ as factor (optional if column is already a string)
golf.ball$design_typ <- factor(golf.ball$design_typ)

# check averages by group (can also be done using dplyr::group_b? option)
tapply(golf.ball$distance, golf.ball$design_typ, mean)

# create a box plot to assess visually
boxplot(golf.ball$distance ~ golf.ball$design_typ)

# perform a one-way ANOVA, since boxplot suggests some heterogeneity
anova.result <- aov(distance ~ design_typ, data = golf.ball)

# check summary of the test results
summary(anova.result)

# as results suggest, at least one of the classes is significantly different
# a Tukey test should be performed next to identify the specific groups/categories
TukeyHS?(anova.result)

# the following can also be tried to perform all pairwise t-tests
# p-values are different but conclusions are the same (matrix shows p-values)
pairwise.t.test(golf.ball$distance, golf.ball$design_typ, p.adjust.method = "BH")

# Advanced: c?ecking equality of variance assumption
# Levene's test
library(car)
leveneTest(distance ~ design_typ, data = golf.ball)
# if p-value > 0.05, good to go ahead with equality of variance assumption

# in case Levene's test suggests unequal variance, 
# Welch ?est can be used that does not assume equal variance
oneway.test(distance ~ design_typ, data = golf.ball)

# in this scenario, pairwise t-test can still be used without equal variance assumption
pairwise.t.test(golf.ball$distance, golf.ball$design_typ, p.ad?ust.method = "BH", pool.sd = FALSE)

# Advanced: Two-way ANOVA
wash.machine <- read.csv("washingMachine.csv")
wash.machine$det_brand <- factor(wash.machine$det_brand)
wash.machine$cycle_time <- factor(wash.machine$cycle_time)

# similar boxplot visualizati?n, for all combinations of the two factors
boxplot(dirt_removed ~ det_brand * cycle_time, data = wash.machine)

# two-way ANOVA with main effects only
anova2.result <- aov(dirt_removed ~ det_brand + cycle_time, data = wash.machine)
summary(anova2.result)

? two-way ANOVA with interaction effects
anova2i.result <- aov(dirt_removed ~ det_brand * cycle_time, data = wash.machine)
summary(anova2i.result)
