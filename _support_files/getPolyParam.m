function [C, g] = getPolyParam(trainDatay, trainDataX, param)
    errVal = zeros(length(param.Carr),length(param.gArr));
    [trainDatay, trainDataX] = shufflerandom(trainDatay, trainDataX);
    data = [trainDatay, trainDataX];
    for i = 1:param.nfold
        [learn, validate] = k_FoldCV_SPLIT(data, param.nfold, i);
        learnData.X = learn(:, 2:end);
        learnData.Y = learn(:, 1);
        validateData.X = validate(:, 2:end);
        validateData.Y = validate(:, 1);
        for j = 1:length(param.Carr)
            param.C = param.Carr(j);
            for k = 1:length(param.gArr)
                param.g = param.gArr(k);
                param.libsvm = ['-s ', num2str(param.s), ' -t ', num2str(param.t),' -c ', num2str(param.C),' -g ', num2str(param.g), ' -b 1'];
                model = svmtrain(learnData.Y, learnData.X, param.libsvm);
                [y_hat, Acc, projection] = svmpredict(validateData.Y, validateData.X, model,' -b 1'); % prediction on the validation data
                errVal(j,k) = errVal(j,k) + mean((y_hat-validateData.Y).^2); %mean square error
            end
        end
    end
    errVal = errVal ./ (param.nfold);
    [minErr1, minErrIdx1] = min(errVal);
    [minErr2, minErrIdx2] = min(minErr1);
    C = param.Carr(minErrIdx1(minErrIdx2));
    g = param.gArr(minErrIdx2);    
end