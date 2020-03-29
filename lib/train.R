###########################################################
### Train a classification model with training features ###
###########################################################
train <- function(feature_df = pairwise_data, par = NULL){
  ### Train an gbm model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  ### load libraries
  if(!require("gbm")){
    install.packages("gbm")
  }
  library(gbm)
  
  if(is.null(par)){
    t = 100
  } else {
    t = par$t
  }
  
  model <- gbm(emotion_idx~., data=feature_df,
                     distribution = "multinomial",
                     n.trees = t, n.minobsinnode =15, shrinkage = 0.1,
               cv.folds = 5)
  
  client_model <- list(model=model,n.trees=t)
  
  return(client_model)
}

