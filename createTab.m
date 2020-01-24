function newTab = createTab(basis,A,I,c,csmall,b)
    AI=[A,I];
%     cb=zeros(1,size(basis,2));
    B=zeros(size(A,1),size(basis,2));
    for i = 1:size(basis,2)
        cb(i)=c(basis(i));
    end
    for i = 1:size(basis,2)
        B(:,i) = AI(:,basis(i));
    end
%     disp(B);
    Bin =inv(B);
    cbBin = cb/B;
    cbBinA_c = cbBin*A-csmall;
    cbBinb = cbBin*b;
    BinA = B\A;
    Binb = B\b;
    newTab = [cbBinA_c,cbBin,cbBinb;BinA,Bin,Binb];
end
