function [L,D,Lt] = GaussElimSym(A)

[n,n] = size(A);
d = zeros(n,1);
L = zeros(n,n)+eye(n);
c = 0;
for k = 1:n-1
    d(k)=A(k,k);
    for i = k+1:n
        L(i,k)=A(i,k)/d(k);
        for j = k+1:i
            A(i,j) = A(i,j)-L(i,k)*d(k)*L(j,k);
            c=c+2;
        end
    end
end
d(n) = A(n,n);
D = diag(d);
Lt = L';
%disp(c);
end