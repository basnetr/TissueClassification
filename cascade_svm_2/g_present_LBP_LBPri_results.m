clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%Presenting test results
load('svmmodels_single_linear.mat');
load('testDataXy.mat');
load('testOutput_linear');

figure;
hold on;
i = 1;
[X_LRH,Y_LRH,T_LRH,AUC_LRH] = perfcurve(testDatay, prob_estimates_LR(:,1),svmmodel_LR.Label(1));
p(i) = plot(X_LRH,Y_LRH,'r', 'LineWidth', 2);
legend_text{i} = ['Elastic ( AUC = ' num2str(AUC_LRH) ' )'];

i = i + 1;
[X_LR,Y_LR,T_LR,AUC_LR] = perfcurve(testDatay, prob_estimates_LR(:,2),svmmodel_LR.Label(2));
p(i) = plot(X_LR,Y_LR,'b', 'LineWidth', 2);
legend_text{i} = ['Vein ( AUC = ' num2str(AUC_LR) ' )'];

legend(p, legend_text);
title('Linear Cascade SVM');
xlabel('Specificity');
ylabel('Sensitivity');