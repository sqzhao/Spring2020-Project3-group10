########################
### Cross Validation ###
########################

### Author: Chengliang Tang
### Project 3


cv.function <- function(feature_df = pairwise_data, K, k){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(feature_df)[1]
  n.fold <- round(n/K, 0)
  set.seed(0)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    cat("Cross validation with fold ", i, "\n")
    train.data <- feature_df[s != i,]
    test.data <- feature_df[s == i,]
    par <-list(eta=k)
    fit <- train(train.data, par)
    pred <- test(fit, test.data[,-which(names(feature_df) == 'emotion_idx')])  
    
    error <- mean(pred != test.data$emotion_idx) 
    print(error)
    cv.error[i] <- error
  }			
  return(c(mean(cv.error),sd(cv.error)))
}