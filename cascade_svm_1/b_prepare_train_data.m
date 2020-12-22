clc; clear all; close all;

addpath('../_libsvm');
addpath('../_support_files');

tissue = {'connective','heart', 'muscular','elastic', 'vein'};
tissueLabel = [1 2 3 4 4];

%Prepare train data
c = 0; %counting total number of data for all classes
for k = 1:5 %counting labels
	for n = 1:420 %images for each tissue
		if ~(( k == 4 && mod(n,2) == 0 ) || ( k == 5 && mod(n,2) == 1))
			A = rgb2gray(imread(['../_database/' tissue{k} 'Train/(' num2str(n) ').jpg']));
			fvLBP = getLBP(A); %1 x n1 feature vector n1 = 256 (8-neighbors)
			fvRILBP = getRILBP(fvLBP); %1 x n2 feature vector n2 = 36
            
			c = c + 1;
			trainDataX_LR(c,:) = [fvLBP fvRILBP];
			trainDatay(c,1) = tissueLabel(k);
		end
	end
end

save('trainDataXy.mat','trainDataX_LR','trainDatay')
[maxTrainFeatV_LR, I] = max(trainDataX_LR); [minTrainFeatV_LR, I] = min(trainDataX_LR);

save('maxTrainFeatV.mat','maxTrainFeatV_LR'); 
save('minTrainFeatV.mat','minTrainFeatV_LR');