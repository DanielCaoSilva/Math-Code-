clear all;
clc;
close all;
format bank;

fprintf('       Simplex Calculator: Version 1\n\n');
fprintf(['Authors: Daniel Silva, Cesar Fregoso and Hector Perez\n\n',...
'This program only solves standard Max LPs with non-negative\n',...
'and <= constraints.\n\n',...
'Values should be entered in strict matrix or vector form. Otherwise',...
'the program will crash and you will need to restart.\n\n\n']);

csmall = input('Enter objective function: ');
A = input('Enter coefficient constraints: ');
b = input('Enter RHS: ');
I = eye(size(A,1));
AI = [A,I];
c = [csmall,zeros(1,size(A,1))];
basis = size(A,2)+1 : size(A,2)+size(A,1);
tab = createTab(basis,A,I,c,csmall,b);
fprintf('\n\nInitial Tableau: \n');
disp(tab);
OptimalSol = zeros(1,size(tab,2)-1);
n = 0;
while min(tab(1,1:size(tab,1)-1))< -.00000005
	n= n+1;
    basis = createBasis(tab,basis);
	tab = createTab(basis,A,I,c,csmall,b);
	fprintf('\n\nTableau %d:\n',n);
    disp(tab);
    for i = 1:size(basis,2)
        OptimalSol(basis(i))=tab(i+1,size(tab,2));
    end
    fprintf('Solution %d:\n',n);
    fprintf(' z  = %.2f\n',tab(1,size(tab,2)));
    for i = 1:size(OptimalSol,2)
%       OptimalSol(i) = tab(i+1,size(tab,2));
        fprintf('x_%d = %.2f\n',i,OptimalSol(i));
    end
end
fprintf('This is the Optimal Tableau and Optimal Solution!\n');
