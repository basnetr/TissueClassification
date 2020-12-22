clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%Generating test results

load('svmmodels_single_linear.mat')
load('maxTrainFeatV.mat');
load('minTrainFeatV.mat');
load('testDataXy.mat');

%Normalizing
testDataX_L = getScaledSVM(testDataX_L, maxTrainFeatV_L, minTrainFeatV_L, 0, 1);
testDataX_R = getScaledSVM(testDataX_R, maxTrainFeatV_R, minTrainFeatV_R, 0, 1);
testDataX_H = getScaledSVM(testDataX_H, maxTrainFeatV_H, minTrainFeatV_H, 0, 1);
testDataX_LR = getScaledSVM(testDataX_LR, maxTrainFeatV_LR, minTrainFeatV_LR, 0, 1);
testDataX_LRH = getScaledSVM(testDataX_LRH, maxTrainFeatV_LRH, minTrainFeatV_LRH, 0, 1);

[predicted_label_L, accuracy_L, prob_estimates_L] = svmpredict(double(testDatay), double(testDataX_L), svmmodel_L, ' -b 1');
[predicted_label_R, accuracy_R, prob_estimates_R] = svmpredict(double(testDatay), double(testDataX_R), svmmodel_R, ' -b 1');
[predicted_label_H, accuracy_H, prob_estimates_H] = svmpredict(double(testDatay), double(testDataX_H), svmmodel_H, ' -b 1');
[predicted_label_LR, accuracy_LR, prob_estimates_LR] = svmpredict(double(testDatay), double(testDataX_LR), svmmodel_LR, ' -b 1');
[predicted_label_LRH, accuracy_LRH, prob_estimates_LRH] = svmpredict(double(testDatay), double(testDataX_LRH), svmmodel_LRH, ' -b 1');


save('testOutput_linear.mat', 'predicted_label_L', 'accuracy_L', 'prob_estimates_L', 'predicted_label_R', 'accuracy_R', 'prob_estimates_R', 'predicted_label_H', 'accuracy_H', 'prob_estimates_H', 'predicted_label_LR', 'accuracy_LR', 'prob_estimates_LR', 'predicted_label_LRH', 'accuracy_LRH', 'prob_estimates_LRH');
