%Numerical Analysis - Jacobi,Gauss-Seidel, Sor Method - HW 7
%Daniel Silva
%Problem: Let A = [2,-1,0,0;-1,2,-1,0;,0,-1,-2,-1;0,0-1,2]
% tridiagonal matirix ^
% with b = [1,0...0,1]'
% for n = 10 and n = 20
% Solve Ax = b using Jacobi, GS and SOR(w=0.5, w=1, w=1.5)

clear all;
close all;
clc;

n=10;
twos = 2*ones(1,n);
negOnes = -1*ones(1,n-1);
mainD = diag(twos);
upDiag = diag(negOnes,1);
downDiag = diag(negOnes,-1);
A = mainD+upDiag+downDiag;
b = [1 zeros(1,n-2) 1]';

n1=20;
twos1 = 2*ones(1,n1);
negOnes1 = -1*ones(1,n1-1);
mainD1 = diag(twos1);
upDiag1 = diag(negOnes1,1);
downDiag1 = diag(negOnes1,-1);
A1 = mainD1+upDiag1+downDiag1;
b1 = [1 zeros(1,n1-2) 1]';
%x = zeros(1,n);




    
xExact = inv(A)*b;
xExact1 = inv(A1)*b1;

Methods = {'Jacobi','Gauss-Seidel','SOR Method(w=0.5)','SOR Method(w=1.0)','SOR Method(w=1.5)'};

Jacobi10 = [jacobi(A,b,50),xExact,xExact-jacobi(A,b,50)];
Jacobi20 = [jacobi(A1,b1,50),xExact1,xExact1-jacobi(A1,b1,50)];
Gauss_Seidel = [gauss_seidel(A,b,24),xExact,xExact-gauss_seidel(A,b,25),];
GS1 = [gauss_seidel(A1,b1,25),xExact1,xExact1-gauss_seidel(A1,b1,25)];
SOR5=[SOR(A,b,25,.5),xExact,xExact-SOR(A,b,25,.5)];
SOR5o=[SOR(A1,b1,25,.5),xExact1,xExact1-SOR(A1,b1,25,.5)];
SOR1=[SOR(A,b,25,1),xExact,xExact-SOR(A,b,25,1)];
SOR1o = [SOR(A1,b1,25,1),xExact1,xExact1-SOR(A1,b1,25,1)];
SOR15=[SOR(A,b,25,1.5),xExact,xExact-SOR(A,b,25,1.5)];
SOR15o = [SOR(A1,b1,25,1.5),xExact1,xExact1-SOR(A1,b1,25,1.5)];


titles = {'n=10','Exact','Err@n=10'};
titles1 = {'n=20','Exact','Err@n=20'};

disp("Using 25 Iterations:");

disp(Methods(1));
disp(titles);
disp(Jacobi10);
disp(titles1);
disp(Jacobi20);

disp(Methods(2));
disp(titles);
disp(Gauss_Seidel);
disp(titles1);
disp(GS1);

disp(Methods(3));
disp(titles);
disp(SOR5);
disp(titles1);
disp(SOR5o);

disp(Methods(4));
disp(titles);
disp(SOR1);
disp(titles1);
disp(SOR1o);

disp(Methods(5));
disp(titles);
disp(SOR15);
disp(titles1);
disp(SOR15o);

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
    
    
    
    
    
    
    
    
    
    

