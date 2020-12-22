clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

load('trainDataXy.mat');
load('maxTrainFeatV.mat');
load('minTrainFeatV.mat');

%Normalizing before training
trainDataX_L = getScaledSVM(trainDataX_L, maxTrainFeatV_L, minTrainFeatV_L, 0, 1);
trainDataX_R = getScaledSVM(trainDataX_R, maxTrainFeatV_R, minTrainFeatV_R, 0, 1);
trainDataX_H = getScaledSVM(trainDataX_H, maxTrainFeatV_H, minTrainFeatV_H, 0, 1);
trainDataX_LR = getScaledSVM(trainDataX_LR, maxTrainFeatV_LR, minTrainFeatV_LR, 0, 1);
trainDataX_LRH = getScaledSVM(trainDataX_LRH, maxTrainFeatV_LRH, minTrainFeatV_LRH, 0, 1);

%Setting SVM Params
param.s = 0; 					% C-SVR
param.t = 0; 					% Linear kernel
param.nfold = 10;				% 10-fold CV
param.Carr = 2.^(-5:2:15);

est_C = [];
disp('Training LR');
param.C = getLinearC(double(trainDatay), double(trainDataX_LR), param);
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_LR = svmtrain(double(trainDatay), double(trainDataX_LR), optparam.libsvm);
est_C = [est_C param.C];

disp('Training LRH');
param.C = getLinearC(double(trainDatay), double(trainDataX_LRH), param);
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_LRH = svmtrain(double(trainDatay), double(trainDataX_LRH), optparam.libsvm);
est_C = [est_C param.C];

disp('Training L');
param.C = getLinearC(double(trainDatay), double(trainDataX_L), param);
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_L = svmtrain(double(trainDatay), double(trainDataX_L), optparam.libsvm);
est_C = [est_C param.C];

disp('Training R');
param.C = getLinearC(double(trainDatay), double(trainDataX_R), param);
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_R = svmtrain(double(trainDatay), double(trainDataX_R), optparam.libsvm);
est_C = [est_C param.C];

disp('Training H');
param.C = getLinearC(double(trainDatay), double(trainDataX_H), param);
optparam = param;
optparam.libsvm = ['-q -s ', num2str(optparam.s), ' -t ', num2str(optparam.t),' -c ', num2str(optparam.C), ' -b 1'];
svmmodel_H = svmtrain(double(trainDatay), double(trainDataX_H), optparam.libsvm);
est_C = [est_C param.C];

save('est_C.mat','est_C')
save('svmmodels_single_linear.mat','svmmodel_L','svmmodel_R','svmmodel_H','svmmodel_LR','svmmodel_LRH');