%Daniel Silva
%Numerical Homework 8

clear all;
close all;
clc;
%Problem 1 
A = [2,1,0,0,0,0;
    1,3,1,0,0,0;
    0,1,4,1,0,0;
    0,0,1,5,1,0;
    0,0,0,1,6,1;
    0,0,0,0,1,7];
q(:,1) = ones(6,1);
exact = eig(A);
%disp(max(exact));
com = (q(:,1)'*A*q(:,1))/((q(:,1)'*q(:,1)));
disp(com);
comE=zeros(1,20);
for i=1:10
    comE(i) = (q(:,i)'*A*q(:,i))/((q(:,i)'*q(:,i)));
    q(:,i+1) = A*q(:,i);
end
%disp(comE);
disp("Problem 1:");
disp("Lambda after k = 10 iterations:");
disp(powerMethod(A,ones(6,1),10));
disp("Lambda after k = 20 iterations:");
disp(powerMethod(A,ones(6,1),20));


%Problem 2
disp("Problem 2:");
muk = zeros(1,20);
eig2 = zeros(1,20);
p2qo = ones(6,1)/norm(ones(6,1));
[eigg,q,mukg,errg] = normVerPowerMethod(A,p2qo,20);
colNames2 = {'k','mu_k','error'};
T2=table([1:20]',mukg',errg','VariableNames',colNames2);
disp(T2);
%disp(max(eigg));
%disp(mukg);
%disp(errg);
 
%Problem 3
disp("Problem 3:");
[v,d] = eig(A);
[eigVal3,eigVect3,muk3,err3]=normVerPowerMethod(A,p2qo,30);
disp('After 30 iterations on A to get lamda_1 and x_1:');
fprintf("lamda_1: = %d\n",max(eigVal3));
g=sprintf('%d ', eigVect3(:,31));
fprintf("x_1':[%s]\n", g);
Aone = A - muk3(30)*eigVect3(:,31)*eigVect3(:,31)';
disp("Aone: ");
disp(Aone)
[eigVal4,eigVect4,muk4,err4]=normVerPowerMethod(Aone,eigVect3(:,31),10);
colNames3 = {'k','mu_k','error'};
T3=table([1:10]',muk4',d(5,5)-muk4','VariableNames',colNames3);
disp(T3);
%disp(muk4(10));
disp("The corresponding eigenvector:");
disp(eigVect4(:,10));
%disp(v(:,5));
%disp(eig(A));
disp("The error in the eigenvector:");
disp(v(:,5)-eigVect4(:,10));
colNames32 = {'x_2','error'};
T32 = table(eigVect4(:,10),v(:,5)-eigVect4(:,10),'VariableNames',colNames32);
disp(T32);


%Problem 4
disp("Problem 4:");
[eig5,vect]=inverseIterMethod(A,p2qo,5,10);
exactEig = d(4,4);
exactEigVe= v(:,4);
colNames4 = {'k','lamda_j','error'};
T4=table([1:10]',eig5',exactEig-eig5','VariableNames',colNames4);
disp(T4);
%disp(eig5);    
colNames42 = {'x_4','error'};
T42 = table(vect(:,10),v(:,4)-vect(:,10),'VariableNames',colNames42);
disp(T42);






function eig = powerMethod(A,qo,it)
    q(:,1)=qo;
    for i =1:it
        eig=(q(:,i)'*A*q(:,i))/((q(:,i)'*q(:,i)));
        q(:,i+1) = A*q(:,i);
    end
end

function [eig,q,muk,err] = normVerPowerMethod(A,qo,it)
    q(:,1) = qo;
    qH(:,1) = A*qo;
    eig = zeros(1,it);
    for k = 1:it
       qH(:,k) = A*q(:,k);
       eig(k)= q(:,k)'*A*q(:,k);
       muk(k)=norm(qH(:,k));
       q(:,k+1)=qH(:,k)/muk(k);
       err(k) = eig(k)-muk(k);
    end
end
function [eig,q] = inverseIterMethod(A,qo,mu,it)
    q(:,1)=qo;
    qH(:,1)=qo;
    for k = 1:it
        B= A-mu*eye(size(A));
        [L,U]=geee(B);
        y = forward(L,q(:,k));
        qH(:,k)=backward(U,y);
        q(:,k+1)=qH(:,k)/norm(qH(:,k));
        eig(k)=q(:,k+1)'*A*q(:,k+1);  
    end
end
function [L,U] = geee(A)
% A is a nxn matrix and 
%it has an LU factorization 
[n,n] = size(A);

for k=1:n-1
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end
L = eye(n,n)+tril(A,-1);
U = triu(A);
end


