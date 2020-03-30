test <- function(model, dat_test){
  
  library("xgboost")
  
 
  pred <- round(predict(model, as.matrix.data.frame(dat_test)),0)
  
  return(pred)
}