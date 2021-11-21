coca = read.csv("CocaCola.csv", stringsAsFactors = TRUE)
coca

attach(df)

factor(Year)

coca$codedYear = recode(df$Year, "1995:2009 = 0:14")
coca

# simple linear
plot(coca$codedYear, Revenues)
ccSimpleFit <- lm(Revenues ~ coca$codedYear)
abline(ccSimpleFit, col = "blue")
summary(ccSimpleFit)

# Quad linear
plot(coca$codedYear^2, Revenues)
ccQuadFit <- lm(Revenues~ coca$codedYear +I(coca$codedYear^2))
summary(ccQuadFit)
cocaFit2 = abline(lm(Revenues ~ I(coca$codedYear^2)), col="red")
summary(ccQuadFit)



#plotting
plot(coca$codedYear, Revenues,
     main="Scatter Plot of ",
     xlab="Recoded Year",
     ylab="Revenue($ billions)")

abline(mfgSimpleFit, col = "blue")


plot(coca$codedYear^2, Revenues,
     main="Scatter Plot of ",
     xlab="Recoded Year",
     ylab="Revenue($ billions)")

abline(mfgQuadFit, col = "red")

#---
#Predict annual forecasts for Revenue in 2011
#Create new data
new_data = data.frame(Year = 2011)

#For linear model - create revenue prediction
predict(ccSimpleFit, new_data)

#For quadratic model - create revenue prediction
predict(ccQuadFit, new_data)
