########################################
### Classification with testing data ###
########################################

test_adv <- function(model, dat_test = h2o_train ){
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  
  pred <- h2o.predict(model, newdata = dat_test)
  return(pred)
}