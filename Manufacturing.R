manufacturing <- read.csv("manufacturing.csv")

attach(manufacturing)

manufacturing

## simple regression
plot(numberRep ,sales )
mfgSimpleFit <- lm(sales ~ numberRep)
abline(mfgSimpleFit, col = "blue")
summary(mfgSimpleFit)

# residual analyses
plot(mfgS?mpleFit)


## quadratic regression
mfgQuadFit <- lm(sales ~ numberRep+I(numberRep^2))
summary(mfgQuadFit)

## test R-square change
anova(mfgQuadFit, mfgSimpleFit, test="Chisq")  # used to determine if the residuals created from the
# 2 regressions are sign?ficantly different or not. Normally just look at R2

## scatter plots 
opar <- par(no.readonly=TRUE)

##par(mfrow=c(1:2))

plot(numberRep, sales,
     main="Scatter Plot of Manufacturing Data (1)",
     xlab="Number of Manufacturer's Reps",
     ylab="Sale? ($ millions)")

abline(lm(sales ~ numberRep), col="blue")

plot(numberRep^2, sales,
     main="Scatter Plot of Manufacturing Data (2)",
     xlab="Number of Manufacturer's Reps Squared",
     ylab="Sales ($ millions)")

abline(lm(sales ~ I(numberRep^2)), ?ol="blue")

##par(opar)

detach(manufacturing)