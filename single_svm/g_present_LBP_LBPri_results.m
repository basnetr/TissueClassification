clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%Presenting test codes other way
load('svmmodels_single_linear.mat');
load('testDataXy.mat');
load('testOutput_linear');

figure;
hold on;
i = 1;
[X_LRH,Y_LRH,T_LRH,AUC_LRH] = perfcurve(testDatay, prob_estimates_LR(:,1),svmmodel_LR.Label(1));
p(i) = plot(X_LRH,Y_LRH,'r', 'LineWidth', 2);
legend_text{i} = ['Connective ( AUC = ' num2str(AUC_LRH) ' )'];

i = i + 1;
[X_LR,Y_LR,T_LR,AUC_LR] = perfcurve(testDatay, prob_estimates_LR(:,2),svmmodel_LR.Label(2));
p(i) = plot(X_LR,Y_LR,'b', 'LineWidth', 2);
legend_text{i} = ['Elastic ( AUC = ' num2str(AUC_LR) ' )'];

i = i + 1;
[X_L,Y_L,T_L,AUC_L] = perfcurve(testDatay, prob_estimates_LR(:,3),svmmodel_LR.Label(3)); 
p(i) = plot(X_L,Y_L,'g', 'LineWidth', 2);
legend_text{i} = ['Heart ( AUC = ' num2str(AUC_L) ' )'];

i = i + 1;
[X_R,Y_R,T_R,AUC_R] = perfcurve(testDatay, prob_estimates_LR(:,4),svmmodel_LR.Label(4));
p(i) = plot(X_R,Y_R,'m', 'LineWidth', 2);
legend_text{i} = ['Muscular ( AUC = ' num2str(AUC_R) ' )'];

i = i + 1;
[X_H,Y_H,T_H,AUC_H] = perfcurve(testDatay, prob_estimates_LR(:,5),svmmodel_LR.Label(5)); 
p(i) = plot(X_H,Y_H,'c', 'LineWidth', 2);
legend_text{i} = ['Vein ( AUC = ' num2str(AUC_H) ' )'];

legend(p, legend_text);
title('Linear SVM');
xlabel('Specificity');
ylabel('Sensitivity');