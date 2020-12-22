function ahist = getLBP(A) %gray value only
    [M, N] = size(A);
    spoints=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
    ahist = zeros(1,256);
    for i = 2:M-1
        for j = 2:N-1
            byte = 0;
            for k = 1:8 %neighbors
                x = spoints(k,1) + i;
                y = spoints(k,2) + j;
                bit = A(x,y) >= A(i,j);
                byte = byte + bit * 2 ^ (k-1);
            end
            ahist(1,byte+1) = ahist(1,byte+1) + 1;
        end
    end
end