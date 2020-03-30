train <- function(feature_df = pairwise_data, par = NULL){

  library("xgboost")
  
  if(is.null(par)){
    eta <- 0.5
  } else {
    eta <- par
  }
  
  label_trn<-as.numeric(as.matrix.data.frame(feature_df['emotion_idx']))
  dtrain<-as.matrix.data.frame(feature_df[,-which(names(feature_df) == 'emotion_idx')])
  
  xgb_fit <- xgboost(data = dtrain, label = label_trn, max.depth = 20,
                     eta = eta, nthread = 30, nrounds = 300 , verbose = 0, gamma =5)
  
  return(model = xgb_fit)
}
