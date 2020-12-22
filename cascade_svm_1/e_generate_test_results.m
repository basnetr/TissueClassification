clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%generate test results
load('svmmodels_single_linear.mat')
load('maxTrainFeatV.mat');
load('minTrainFeatV.mat');
load('testDataXy.mat');

%Normalizing
testDataX_LR = getScaledSVM(testDataX_LR, maxTrainFeatV_LR, minTrainFeatV_LR, 0, 1);

[predicted_label_LR, accuracy_LR, prob_estimates_LR] = svmpredict(double(testDatay), double(testDataX_LR), svmmodel_LR, ' -b 1');

save('testOutput_linear.mat', 'predicted_label_LR', 'accuracy_LR', 'prob_estimates_LR');
