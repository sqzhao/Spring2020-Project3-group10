########################################
### Classification with testing data ###
########################################

test_adv <- function(my_ensemble, dat_test = h2o_test ){
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  
  pred <- h2o.predict(my_ensemble, newdata = dat_test)
  return(pred)
}