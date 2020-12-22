function fvri = getRILBP(fvlbp)
    mapping = getmapping(8,'ri'); %other availables are 'u2' for uniform LBP, 'ri' for rotation-invariant LBP and 'riu2' for uniform rotation-invariant LBP.

    fvri = double(zeros(1,36));
    for k = 1:256
        fvri(mapping.table(k) + 1) = fvri(mapping.table(k) + 1) + fvlbp(k);
    end
end