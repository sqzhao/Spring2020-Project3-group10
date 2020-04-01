########################
### Cross Validation ###
########################

### Project 3

cv.function <- function(dat_train, K, t){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(dat_train)[1]
  n.fold <- round(n/K, 0)
  set.seed(0)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- 0
  y<-'emotion_idx'
  
 
    train.data <- as.h2o(dat_train[s != i,])
    test.data <- as.h2o(dat_train[s == i,])
    
    
    par <- list(t=t,nfolds = K)
    
    cvmodel<-train_adv(train.data, par)
    
    
   
    confusion_matrix<-as.data.frame(h2o.confusionMatrix(cvmodel$model, newdata = test.data))
    error <-  confusion_matrix[['Error']][23]
    print(error)
    
  		
  return(error)
}