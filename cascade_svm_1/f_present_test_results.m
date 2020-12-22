clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%present test results
load('svmmodels_single_linear.mat');
load('testDataXy.mat');
load('testOutput_linear');

titles = {'Connective ', 'Heart      ', 'Muscular   ', 'ElasticVein'};
disp(sprintf('\t\t\tLR'))

for m = 1:4
    figure;
    hold on;
    i = 1;

    [X_LR,Y_LR,T_LR,AUC_LR] = perfcurve(testDatay, prob_estimates_LR(:,m),svmmodel_LR.Label(m));
    p(i) = plot(X_LR,Y_LR,'b', 'LineWidth', 2);
    legend_text{i} = ['LBP + LBPri8 ( AUC = ' num2str(AUC_LR) ' )'];
    
    legend(p, legend_text);
    title(titles{m});
    
    disp([sprintf([titles{m} '\t']) num2str([AUC_LR], '\t\t%.5f')])
end
