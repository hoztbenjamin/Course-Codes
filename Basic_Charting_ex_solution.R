# Sample Solution to exercises in basic_charting_notes.r
attach(mtcars)


# (1) Stacked Bar Plot

# create a table with row=vs and col=gear 
counts <- table(mtcars$vs, mtcars$gear)
#    3 4 5
# 0 12 2 4
# 1 3 10 1

# R recognises each col as Group, and each row as a subgroup
# and plots them automatically
barplot(counts, main="Stacked bars of Gears and VS",
	xlab="Number of Gears", col=c("darkblue","red"),
	legend = rownames(counts)) 

# (2) Stacked Bars of Cyl and gear 
gearcyl = table(mtcars$cyl, mtcars$gear)
barplot(gearcyl, main = "Stacked Bars of Gears and Cyl", 
	xlab = "Number of Gears", ylab= "Frequency", 
	col = c("yellow", "red", "green"), 
	legend = rownames(gearcyl))


# (3) Grouped Bar Plot

# "beside" allows toggle between the grouped and the stacked barchart
counts = table(mtcars$vs, mtcars$gear)
barplot(counts, main="Distribution by Gears and VS",
	xlab="Number of Gears", 
	col=c("darkblue","red"), 
	legend = rownames(counts), beside=TRUE) 

# (4) Scatter plots
# positive relationship. The > Mpg, the slower pickup
plot(qsec, mpg,
     xlab="qsec", ylab="MPG")
abline(lm(mpg ~ qsec, data = mtcars), col = "blue")

# inconclusive but inclined towards no relationship
plot(qsec, wt,
     xlab="qsec", ylab="WT")
abline(lm(wt ~ qsec, data = mtcars), col = "blue")

# has negative relationship. The higher HP the fast pickup
plot(qsec, hp,
     xlab="qsec", ylab="HP")
abline(lm(hp ~ qsec, data = mtcars), col = "blue")

# negative or inconclusive (outliers)
plot(qsec, disp,
     xlab="qsec", ylab="DISP")
abline(lm(disp ~ qsec, data = mtcars), col = "blue")



