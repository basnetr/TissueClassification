clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

%Preparing testing data
tissue = {'connective', 'elastic', 'heart', 'muscular', 'vein'};
tissueLabel = [1 2 3 4 5];
c = 0;

for k = 1:5
    for n = 1:180	
		A = rgb2gray(imread(['../_database/' tissue{k} 'Test/(' num2str(n) ').jpg']));
		fvLBP = getLBP(A); %1 x n1 feature vector n1 = 256 (8-neighbors)
		fvRILBP = getRILBP(fvLBP); %1 x n2 feature vector n2 = 36
		fvH= getharalick(A); %1 x n3 feature vector n3 = 6 (Selected Haralick Only)
		
		c = c + 1;	
		testDataX_L(c,:) = fvLBP;
        testDataX_R(c,:) = fvRILBP;
        testDataX_H(c,:) = fvH;
        testDataX_LR(c,:) = [fvLBP fvRILBP];
        testDataX_LRH(c,:) = [fvLBP fvRILBP fvH];
        testDatay(c,1) = tissueLabel(k);
    end    
end

save('testDataXy.mat','testDataX_L','testDataX_R','testDataX_H','testDataX_LR','testDataX_LRH','testDatay')