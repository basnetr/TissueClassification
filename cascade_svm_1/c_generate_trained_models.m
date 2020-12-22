clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%generate trained models
load('trainDataXy.mat');
load('maxTrainFeatV.mat');
load('minTrainFeatV.mat');

%Normalizing before training
trainDataX_LR = getScaledSVM(trainDataX_LR, maxTrainFeatV_LR, minTrainFeatV_LR, 0, 1);

%Setting SVM Params
param.s = 0; 					% C-SVR
param.t = 0; 					% Linear kernel
param.nfold = 10;				% 10-fold CV

param.C = 0.5; 
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_LR = svmtrain(double(trainDatay), double(trainDataX_LR), optparam.libsvm);

save('svmmodels_single_linear.mat','svmmodel_LR'); 