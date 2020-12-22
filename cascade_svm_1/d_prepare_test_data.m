clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%prepare test data
tissue = {'connective', 'heart', 'muscular', 'elastic', 'vein'};
tissueLabel = [1 2 3 4 4];
c = 0;
for k = 1:5
    for n = 1:180	
        if ~(( k == 4 && mod(n,2) == 0 ) || ( k == 5 && mod(n,2) == 1))
            A = rgb2gray(imread(['../_database/' tissue{k} 'Test/(' num2str(n) ').jpg']));
            fvLBP = getLBP(A); %1 x n1 feature vector n1 = 256 (8-neighbors)
            fvRILBP = getRILBP(fvLBP); %1 x n2 feature vector n2 = 36
            c = c + 1;	
            testDataX_LR(c,:) = [fvLBP fvRILBP];
            testDatay(c,1) = tissueLabel(k);
        end
    end    
end
save('testDataXy.mat','testDataX_LR','testDatay')