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

We were provided with a set of 2,500 facial images with 22 different emotions. Our client is interested in creating a mobile AI program that accurately recognizes the emotion from facial images. The current practice on our client side is using boosted decision stumps on full facial landmark features.

We take our client's current practice as our baseline model yet only use the inner face fiducial points to train the GBM model. In this baseline model, it has around 42.4% accurate rate for predicting emotions.

To improve the baseline model performance, we try to developed an advanced model. Used only inner face features, we tried different candidate models including Xgboost, PCA&LDA, SVM and the stacking model of Neural Network and GBM. We noted that the stacking model of Neural Network and GBM stood out to our team. Having conducted in-depth research and simulated accuracy rates from different sampled train vs test datasets, we noted that svm performed stably well, whereas deep learing model sometimes did overperformed svm model but it had a great variation. Therefore, We finally choose the stacking model as our final choice.

We has achieved an accuracy rate of 49% which improves our client's current model and at the same time, our model achieved high efficiency since running time doesn't increase much.

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
