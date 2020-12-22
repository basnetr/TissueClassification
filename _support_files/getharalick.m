function h = getharalick(A)
    [M,N] = size(A);
    coMat = graycomatrix(A, 'NumLevels', 256 ,'Offset', [0 1] ,'GrayLimits',[0 255], 'Symmetric', false);
    coMat = coMat/((M-1)*N); % Normalizing
    h = haralickTextureFeatures(coMat);
    h = h';
	h = h([2 1 5 9 12 13]);
end