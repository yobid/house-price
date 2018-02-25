library(caret)
library(dplyr)
library(ModelMetrics)
library(ggplot2)

training <- read.csv(file="train.csv", stringsAsFactors = FALSE)

#feature enginnering
source("cleanNa.R")
trainC <- cleanNa(training)
for (i in c(1:80)) {
        x <- is.character(trainC[,i])
        if (x==TRUE) {
                trainC[,i] <- as.factor(trainC[,i])
        }
}

#train and test set
set.seed(7)
inTrain <- createDataPartition(trainC$Id, p=0.7, list=FALSE)
train1 <- trainC[inTrain, ]
test1 <- trainC[-inTrain, ]
out1 <- test1$SalePrice
test1 <- select(test1, -SalePrice)

#fit models
fit1 <- train(SalePrice~., data=train1, method="gbm", verbose=FALSE)
fit2 <- train(SalePrice~., data=train1, method="rf")

#predicting on test (training) set
pred1 <- predict(fit1, test1)
accu <- data.frame(fit = "gbm", rmse = rmse(log(out1), log(pred1)))
pred2 <- predict(fit2, test1)
accu <- rbind(accu, data.frame(fit="rf", rmse=rmse(log(out1), log(pred2))))
#compute the mean of the two predictions
input3 <- as.data.frame(cbind(pred1, pred2))
pred3 <- apply(input3, 1, mean )
accu <- rbind(accu, data.frame(fit="+mean", rmse=rmse(log(out1), log(pred3))))
qplot(fit, rmse, data=accu)

#creating output
testing <- read.csv(file="test.csv", stringsAsFactors = FALSE)
#preprocessing
testC <- cleanNa(testing)
for (i in c(1:79)) {
        x <- is.character(testC[,i])
        if (x==TRUE) {
                testC[,i] <- as.factor(testC[,i])
        }
}
source("fillNAtest.R")
test1 <- testNa(testC)
pred1 <- predict(fit1, test1)
pred2 <- predict(fit2, test1)
input3 <- as.data.frame(cbind(pred1, pred2))
pred4 <- apply(input3, 1, mean )
submission <- cbind.data.frame(test1$Id, pred4)
names(submission) <- c("Id", "SalePrice")
write.csv(submission, file="sub.csv", row.names=FALSE)