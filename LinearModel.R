##################################################
# 2016 MLB Run Scoring - Linear Regression Model #
##################################################


# read data
BattingData = read.csv("TeamBattingData.csv")


# fit linear model
LinearModel = lm(Runs ~ Singles + Doubles + Triples + HR + BB + HBP + SO + SB, data=BattingData)
summary(LinearModel)


# predicted runs
ExpectedRuns = predict(LinearModel, type="response")


# plot Expected vs. Actual
plot(ExpectedRuns, BattingData$Runs, xlab = "Expected Runs", ylab = "Actual Runs", pch = 16, col = "blue")
abline(lm(BattingData$Runs ~ ExpectedRuns), col="red")


# combine Actual and Expected Runs into one data frame
combined = data.frame(BattingData$Team, BattingData$Runs, ExpectedRuns)


# export to csv
write.csv(combined, "RunsModel.csv")