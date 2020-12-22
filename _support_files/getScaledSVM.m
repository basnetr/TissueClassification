function featData = getScaledSVM(featData, maxFeatV, minFeatV, lRange, uRange)
    fData = featData;
    MaxV = maxFeatV;
    MinV = minFeatV;
    [R, C] = size(fData);
    
    scaledData = (fData-ones(R,1)*MinV) .* (ones(R,1) * ((uRange-lRange) * ones(1,C)./(MaxV-MinV))) + lRange;
    
    for i=1:size(fData,2)
        if(all(isnan(scaledData(:,i))))
            scaledData(:,i)=0;
        end
    end
    featData=scaledData;
end