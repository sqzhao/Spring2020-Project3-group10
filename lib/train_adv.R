###########################################################
### Train a classification model with training features ###
###########################################################
train_adv <- function(feature_df = h2o_train, par = NULL){
  ### Train an gbm model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  ### load libraries
  if(!require("h2o")){
    install.packages("h2o")
  }


  y<-'emotion_idx'
  
  
  if(is.null(par)){
    t = 200
    nfolds = 5
  } else {
    t = par$t
    nfolds = par$nfolds
  }
  
  my_gbm <- h2o.gbm(y = y,
                    training_frame = feature_df,
                    distribution = "multinomial",
                    ntrees = 50,
                    max_depth = 3,
                    min_rows = 2,
                    learn_rate = 0.1,
                    nfolds = nfolds,
                    fold_assignment = "Modulo",
                    keep_cross_validation_predictions = TRUE,
                    seed = 1)
  
  my_dl<-h2o.deeplearning(y=y,
                          training_frame = feature_df,
                          distribution = "multinomial",
                          hidden = c(t,t),
                          nfolds = nfolds,
                          fold_assignment = "Modulo",
                          seed = 1,
                          keep_cross_validation_predictions = TRUE)
  
  ensemble <- h2o.stackedEnsemble(y = y,
                                  training_frame = feature_df,
                                  model_id = "my_ensemble",
                                  base_models = list(my_gbm, my_dl),
                                  seed =1)
  
  client_model <- list(model=ensemble)
  
  return(client_model)
}

