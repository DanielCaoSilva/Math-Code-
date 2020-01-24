%Daniel Silva
%Numerical Analysis - 5080 - VonBremen 
%11 - 26 - 19
%Programming Project 

clear all;
close all;
clc;

%Problem 4:

iterBegin = 10;
iterEnd = 100;
t0 = zeros(1,iterEnd);
t1 = zeros(1,iterEnd);
t2 = zeros(1,iterEnd);
t3 = zeros(1,iterEnd);
t4 = zeros(1,iterEnd);
t5 = zeros(1,iterEnd);
for n = iterBegin:iterEnd
    %Make H matrix
    mainD = 2*diag(ones(1,n));
    negDiagVect = -1*ones(1,n-1);
    upDiag = diag(negDiagVect,1);
    downDiag = diag(negDiagVect,-1);
    H = mainD + upDiag + downDiag;
    b = [1 zeros(1,n-2) 1]';
    
    startWOPivot=tic;
    [L,U] = Gauss_NoPivot(H);
    yWOP = forward(L,b);
    xWOP = backward(U,yWOP);
    t0(n) = toc(startWOPivot);
    
    startJacobi = tic;
    xJ = jacobi(H,b,n);
    t1(n) = toc(startJacobi);
    
    startGS = tic;
    xGS = gauss_seidel(H,b,n);
    t2(n) = toc(startGS);
    
    startSOR5 = tic;
    xSOR5 = SOR(H,b,n,0.5);
    t3(n) = toc(startSOR5);
    
    startSOR1 = tic;
    xSOR1 = SOR(H,b,n,1.0);
    t4(n) = toc(startSOR1);
    
    startSOR15 = tic;
    xSOR15 = SOR(H,b,n,1.5);
    t5(n) = toc(startSOR15);
end
ex = inv(H)*b;
exact = (norm(ex));
eWOPer=(norm(xWOP));
eJer=(norm(xJ));
eGSS = norm(xGS);
eS5 = norm(xSOR5);
eS1 = norm(xSOR1);
eS15 = norm(xSOR15);



axis = log(iterBegin:iterEnd);
T0 = log(t0(iterBegin:iterEnd));
T1 = log(t1(iterBegin:iterEnd));
T2 = log(t2(iterBegin:iterEnd));
T3 = log(t3(iterBegin:iterEnd));
T4 = log(t4(iterBegin:iterEnd));
T5 = log(t5(iterBegin:iterEnd));
poly0=polyfit(axis,T0,1);
poly1=polyfit(axis,T1,1);
poly2=polyfit(axis,T2,1);
poly3=polyfit(axis,T3,1);
poly4=polyfit(axis,T4,1);
poly5=polyfit(axis,T5,1);
z0=polyval(poly0,axis);
z1=polyval(poly1,axis);
z2=polyval(poly2,axis);
z3=polyval(poly3,axis);
z4=polyval(poly4,axis);
z5=polyval(poly5,axis);
loglog(iterBegin:iterEnd,t0(iterBegin:iterEnd),'r-','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t1(iterBegin:iterEnd),'k--','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t2(iterBegin:iterEnd),'g--','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t3(iterBegin:iterEnd),'b-','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t4(iterBegin:iterEnd),'y--','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,t5(iterBegin:iterEnd),'o--','LineWidth',1)
hold on;
loglog(iterBegin:iterEnd,exp(z0));
hold on;
loglog(iterBegin:iterEnd,exp(z1));
hold on;
loglog(iterBegin:iterEnd,exp(z2));
hold on;
loglog(iterBegin:iterEnd,exp(z3));
hold on;
loglog(iterBegin:iterEnd,exp(z4));
hold on;
loglog(iterBegin:iterEnd,exp(z5));
hold off;
legend('Gauss-Elimination w/o Pivoting','Jacobi','Gauss-Seidel',...
    'SOR_w=0.5','SOR_w=1.0','SOR_w=1.5',...
    num2str(poly0(1),'LineForGaussNoPivot with slope a=%.3f'),...
    num2str(poly1(1),'LineForJacobi with slope a=%.3f'),...
    num2str(poly2(1),'LineForGauss-Seidel with slope a=%.3f'),...
    num2str(poly3(1),'LineForSORw=0.5 with slope a=%.3f'),...
    num2str(poly4(1),'LineForSORw=1.0 with slope a=%.3f'),...
    num2str(poly5(1),'LineForSORw=1.0 with slope a=%.3f'),...
        'Location','SouthEast')%,'Orientation','Horizontal')
legend('BoxOff')
xlabel('n','FontSize',20)
ylabel('CPU time','FontSize',20)
title('CPU time vs n');

%Gauss-elimination without pivoting
function [L,U] = Gauss_NoPivot(A)
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
%Jacobi
function x = jacobi(A, b, N)
	Da = diag(diag(A)); % Only the diagonal
	La = tril(A,-1);
    Ua = triu(A,1);
	x = zeros(size(b, 1), 1); % initial 
    
    for i = 1:N
        % Jacobi Sum using Matlab's built in multiplication
		x = Da \ (b - (La+Ua) * x);
    end
end
%Gauss_Seidel
function x = gauss_seidel(A,b,N)
    Da = diag(diag(A)); % Only the diagonal
    La = tril(A,-1);
    Ua = triu(A,1);
    %disp(La);
    %disp(Ua);
	x = zeros(size(b, 1), 1); % initial 
    for i = 1:N
        x = (Da+La)\(b-Ua*x);
    end
end
%SOR Method
function x = SOR(A,b,N,w)
    Da = diag(diag(A)); % Only the diagonal
    La = tril(A,-1);
    Ua = triu(A,1);
    x = zeros(size(b, 1), 1); % initial
    for i = 1:N
        Bsor = ((Da+w*La)\((1-w)*Da-w*Ua));
        Csor = (Da+w*La)\(w*b);
        x = Bsor*x+Csor;
    end
end