# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2020

+ Team 10
+ Team members
	+ Li, Guoying (gl2669)
	+ Ling, Liangcao (ll3337)
	+ Lyu, Wenfeng (wl2733)
	+ Miao, Xinwen (xm2242)
	+ Zhang, Tianya (tz2430)
	+ Zhao, Siqi (sz2866)

+ Project summary: In this project, we created a classification engine for facial emotion recognition. 

We were provided with a set of 2,500 facial images with 22 different emontions. Our client is interested in creating an mobile AI program that accurately recognizes the emotion from facial images. The current practice on our client side is using boosted decision stumps on facial landmark features in which 6006 features are drawn from raw images and 78 ficucial points and Gradient Boosting Model (GBM) is implemented to train the model and make prediction. We take our client's current practice as our baseline model. In this baseline, it generates an around 38.2% of accurate rate for predicting emontions, the accuracy which does not reduce much, although we select half face points and reduce into 506 features (= 23 * 22)

With the reducing number of features, we tried more different advanced model with tunned parameters to train the features, such as Xgboost, SVM and Deep Learing model. we noted that SVM and Deep Learing models stood out to our team. Having conducted in-depth research and simulated accuracy rates from different sampled train vs test datasets, we noted that svm performed stably well, whereas deep learing model sometimes did overperformed svm model but it had a great variation. Therefore, We finally choose svm as our training model.

We has achieved an accuracy rate of 53.4% which improves our client's current model and at the same time, our model achieved high efficiency since running time has been greatly reduced.

**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
