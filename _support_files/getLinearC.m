function C = getLinearC(trainDatay, trainDataX, param)
    errVal = zeros(1,length(param.Carr));
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
            param.libsvm = ['-q -s ', num2str(param.s), ' -t ', num2str(param.t),' -c ', num2str(param.C), ' -b 1'];
            model = svmtrain(learnData.Y, learnData.X, param.libsvm);
            [y_hat, Acc, projection] = svmpredict(validateData.Y, validateData.X, model,' -b 1 -q'); % prediction on the validation data
            errVal(j) = errVal(j) + mean((y_hat-validateData.Y).^2); %mean square error
        end
    end
    errVal = errVal ./ (param.nfold);
    [minErr, minErrIdx] = min(errVal);
    C = param.Carr(minErrIdx);
end