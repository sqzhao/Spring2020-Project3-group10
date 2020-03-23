install.packages("e1071")
library(e1071)
library(kernlab)

# tuning 
a <- dat_train[1:200,]
a$emotion_idx

obj <- tune.svm(emotion_idx~., data = a, gamma = 2^(-1:1), cost = 2^(2:4))
model<- svm(emotion_idx ~ ., data = a, kernel = "radial", cost = 4, scale = FALSE, gamma =0.5 )
svm.pred <- predict(object = model, newdata = dat_test)
accu <- mean(dat_test$emotion_idx == svm.pred)

# currently using 
classifier = train(form = emotion_idx~., data =dat_train, method = 'svmRadial')
save(classifier,file="/Users/meow/Documents/GitHub/Spring2020-Project3-group10/output/svmclassifier.RData")

classifier$bestTune

rad_svm_fit = ksvm(emotion_idx ~ ., data = dat_train, kernel = 'rbfdot', C = 1, sigma = 0.0006176977)

ksvm.pred <- predict(object = rad_svm_fit, newdata = dat_test)
accu <- mean(dat_test$emotion_idx == ksvm.pred)


#model 
svm_model<- svm(emotion_idx ~ ., data = dat_train, kernel = "radial", cost = 1, scale = FALSE, gamma =)

#predict on test data
svm.pred <- predict(object = svm_model, newdata = dat_test)

#prediction result
confusionMatrix(svm.pred, dat_test$emotion_idx, dnn = c("Prediction", "Reference"))

accu <- mean(dat_test$emotion_idx == svm.pred)

pred.result.factor <- as.factor(as.numeric(apply(svm.pred, 1, which.max)))
baseline.confusion.mat = confusionMatrix(dat_test$emotion_idx,pred.result.factor)
# error rate
baseline.confusion.mat$overall["Accuracy"]