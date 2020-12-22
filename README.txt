1. "_database" should contain Training (420) and Testing (180) tissue images of size 100x100 for each tissue class.
Database can be downloaded from: http://biscar.univalle.edu.co/?page _ id=1003

2. "_libsvm" contains LIBSVM files that can be downloaded from: https://www.csie.ntu.edu.tw/~cjlin/libsvm/

3. Support file contains functions to extract features from the images namely, Local Binary Patterns (LBP), Rotational Invariant Local Binary Patterns (LBPri), and Haralick Features and other support functions for SVM and k-fold cross validation.

4. To implement different SVM approaches, Cascade SVM (Phase I), Cascade SVM (Phase II), and Single SVM, run the file "a_main.m" in the corresponding folder.
Phase I - Classification into Muscular, Heart, Connective and Elastic-Vein tissues
Phase II - Classification of Elastic-Vein tissues into Elastic and Vein tissues

5. Output will generate ROC curves with AUC scores for the result of using each feature or a combination of the features. 