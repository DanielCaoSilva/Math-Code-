function [L,U] = geee(A)
% A is a nxn matrix and 
%it has an LU factorization 
[n,n] = size(a);

for k=1:n-1
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end
L = eye(n,n)+tril(A,-1);
U = triu(A);
end