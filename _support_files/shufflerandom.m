function [y, X] = shufflerandom(y, X)
    A = [y X];
    [m,n] = size(A) ;
    idx = randperm(m) ;
    B(idx,:) = A(:,:);  % first row arranged randomly 
    y = B(:,1);
    X = B(:,2:end);
end


