clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%generating trained models

load('trainDataXy.mat');
load('maxTrainFeatV.mat');
load('minTrainFeatV.mat');

%Normalizing before training
trainDataX_LR = getScaledSVM(trainDataX_LR, maxTrainFeatV_LR, minTrainFeatV_LR, 0, 1);

%Setting SVM Params
param.s = 0; 					% C-SVR
param.t = 1; 					% Polynomial kernel
param.nfold = 10;				% 10-fold CV
param.Carr = 2.^(-5:2:15);
param.gArr = 2.^(-15:3);			% range of the gamma parameter

param.C = 128; %getPolyParam(double(trainDatay), double(trainDataX_LR), param);
param.g = 0.001953;
optparam = param;
optparam.libsvm = ['-s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_LR = svmtrain(double(trainDatay), double(trainDataX_LR), optparam.libsvm);

save('svmmodels_single_linear.mat','svmmodel_LR');