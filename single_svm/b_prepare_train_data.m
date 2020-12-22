clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

tissue = {'connective', 'elastic', 'heart', 'muscular', 'vein'};
tissueLabel = [1 2 3 4 5];

%Prepare train data
c = 0; %counting total number of data for all classes
for k = 1:5 %counting labels
	for n = 1:420 %images for each tissue
		A = rgb2gray(imread(['../_database/' tissue{k} 'Train/(' num2str(n) ').jpg']));
		fvLBP = getLBP(A); %1 x n1 feature vector n1 = 256 (8-neighbors)
		fvRILBP = getRILBP(fvLBP); %1 x n2 feature vector n2 = 36
		fvH= getharalick(A); %1 x n3 feature vector n3 = 6 (Selected Haralick Only)
		
		c = c + 1;
		trainDataX_L(c,:) = fvLBP;
        trainDataX_R(c,:) = fvRILBP;
        trainDataX_H(c,:) = fvH;
		trainDataX_LR(c,:) = [fvLBP fvRILBP];
        trainDataX_LRH(c,:) = [fvLBP fvRILBP fvH];
        trainDatay(c,1) = tissueLabel(k);
	end
end

save('trainDataXy.mat','trainDataX_L','trainDataX_R','trainDataX_H','trainDataX_LR','trainDataX_LRH','trainDatay')
[maxTrainFeatV_L, I] = max(trainDataX_L); [minTrainFeatV_L, I] = min(trainDataX_L);
[maxTrainFeatV_R, I] = max(trainDataX_R); [minTrainFeatV_R, I] = min(trainDataX_R);
[maxTrainFeatV_H, I] = max(trainDataX_H); [minTrainFeatV_H, I] = min(trainDataX_H);
[maxTrainFeatV_LR, I] = max(trainDataX_LR); [minTrainFeatV_LR, I] = min(trainDataX_LR);
[maxTrainFeatV_LRH, I] = max(trainDataX_LRH); [minTrainFeatV_LRH, I] = min(trainDataX_LRH);


save('maxTrainFeatV.mat','maxTrainFeatV_L','maxTrainFeatV_R','maxTrainFeatV_H','maxTrainFeatV_LR','maxTrainFeatV_LRH'); 
save('minTrainFeatV.mat','minTrainFeatV_L','minTrainFeatV_R','minTrainFeatV_H','minTrainFeatV_LR','minTrainFeatV_LRH');