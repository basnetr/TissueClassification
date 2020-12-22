clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%Presenting test results
load('svmmodels_single_linear.mat');
load('testDataXy.mat');
load('testOutput_linear');

titles = {'Connective', 'Elastic   ', 'Heart     ', 'Muscular  ', 'Vein      '};
% titles = {'Conn', 'Elas', 'Hear', 'Musc', 'Vein'};
disp(sprintf('\t\t\tLRH\t\t\tLR\t\t\tL\t\t\tR\t\t\tH'))

for m = 1:5
    figure;
    hold on;
    i = 1;
    [X_LRH,Y_LRH,T_LRH,AUC_LRH] = perfcurve(testDatay, prob_estimates_LRH(:,m),svmmodel_LRH.Label(m));
    p(i) = plot(X_LRH,Y_LRH,'r', 'LineWidth', 2);
    legend_text{i} = ['LBP + LBPri8 + Haralick ( AUC = ' num2str(AUC_LRH) ' )'];
    
    i = i + 1;
    [X_LR,Y_LR,T_LR,AUC_LR] = perfcurve(testDatay, prob_estimates_LR(:,m),svmmodel_LR.Label(m));
    p(i) = plot(X_LR,Y_LR,'b', 'LineWidth', 2);
    legend_text{i} = ['LBP + LBPri8 ( AUC = ' num2str(AUC_LR) ' )'];
    
    i = i + 1;
    [X_L,Y_L,T_L,AUC_L] = perfcurve(testDatay, prob_estimates_L(:,m),svmmodel_L.Label(m)); 
    p(i) = plot(X_L,Y_L,'g', 'LineWidth', 2);
    legend_text{i} = ['LBP ( AUC = ' num2str(AUC_L) ' )'];
    
    i = i + 1;
    [X_R,Y_R,T_R,AUC_R] = perfcurve(testDatay, prob_estimates_R(:,m),svmmodel_R.Label(m));
    p(i) = plot(X_R,Y_R,'m', 'LineWidth', 2);
    legend_text{i} = ['LBPri8 ( AUC = ' num2str(AUC_R) ' )'];
    
    i = i + 1;
    [X_H,Y_H,T_H,AUC_H] = perfcurve(testDatay, prob_estimates_H(:,m),svmmodel_H.Label(m)); 
    p(i) = plot(X_H,Y_H,'c', 'LineWidth', 2);
    legend_text{i} = ['Haralick ( AUC = ' num2str(AUC_H) ' )'];
    
    legend(p, legend_text);
    title(titles{m});
    xlabel('Specificity');
    ylabel('Sensitivity');
    disp([sprintf([titles{m} '\t']) num2str([AUC_LRH AUC_LR AUC_L AUC_R AUC_H], '\t\t%.5f')])
end
