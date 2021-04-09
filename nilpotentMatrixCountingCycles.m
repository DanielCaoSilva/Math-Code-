clear all;
close all;
clc;

%Daniel Silva 
%Nilpotent Adjacency Matrix 

%Define Symbolic vars and k value
c = sym('c',[1,8]);
m = 7;  %The number of cycles 

%Nilpotent Adjacency Matrix for Example 2.2
Atest = [0, c(2), c(3),   0;
      c(1),    0, c(3), c(4);
      c(1), c(2),    0, c(4);
         0, c(2), c(3),   0];
%Nilpotent Adjacency Matrix for K33
Ak33 = [  0, c(2),    0, c(4),    0,  c(6);
       c(1),    0, c(3),    0, c(5),     0;
          0, c(2),    0, c(4),    0,  c(6);
       c(1),    0, c(3),    0, c(5),     0;
          0, c(2),    0, c(4),    0,  c(6);
       c(1),    0, c(3),    0, c(5),    0];

%Nilpotent Adjacency Matrix for K331
Ak331 = [  0, c(2),    0, c(4),    0, c(6), c(7);
        c(1),    0, c(3),    0, c(5),    0, c(7);
           0, c(2),    0, c(4),    0, c(6), c(7);
        c(1),    0, c(3),    0, c(5),    0, c(7);
           0, c(2),    0, c(4),    0, c(6), c(7);
        c(1),    0, c(3),    0, c(5),    0, c(7);
        c(1), c(2), c(3), c(4), c(5), c(6),   0];
%Hypercube example
Acube = [0, c(2), c(3), c(4),    0,    0,    0,    0;
      c(1),    0,    0,    0, c(5), c(6),    0,    0;
      c(1),    0,    0,    0,    0, c(6), c(7),    0;
      c(1),    0,    0,    0, c(5),    0, c(7),    0;
         0, c(2),    0, c(4),    0,    0,    0, c(8);
         0, c(2), c(3),    0,    0,    0,    0, c(8);
         0,    0, c(3), c(4),    0,    0,    0, c(8);
         0,    0,    0,    0, c(5), c(6), c(7),   0];

%Computations 
AtoM = Ak331^m;  %When I plug in the nilpotent 
[Arows,Acols] = size(AtoM);
disp(AtoM);
tr = expand(trace(AtoM));
[cof,t] = coeffs(tr,c);
coefSum = sum(cof);
allPossibleMCycles = generatePossibleCyclesArray(m,Arows,c);
may = checkPossibleCycles(allPossibleMCycles,t);
[numCycles,cycleIndex] = getNumberOfCycles(may,cof);
list = createListOfActualCycles(cycleIndex,t);

%Printing Background Info
fprintf("Possible M Cycles:\n");
disp(allPossibleMCycles);
fprintf("The Logical Check Matrix:\n");
disp(may);
fprintf("Here is the polynomial: \n%s\n",tr);
fprintf("The sum of the coefficients: %f\n",coefSum);

%Printing the Cycles
fprintf("Actual Cycles list:\n");
disp(list');

%Printing Cycle Numbers 
fprintf("\n\n\n");
fprintf("The total number of %i cycles: %10i\n",m,numCycles);
fprintf("The undirected number of %i cycles: %5i\n",m,numCycles/2);
fprintf("The free number of %i cycles: %10i\n",m,numCycles/(2*m));

%Functions
function list = createListOfActualCycles(cycleIndex,t)
    for i = 1:length(cycleIndex)-1
        list(i) = t(cycleIndex(i+1));
    end
end
%Uses to logical Array to get the index of the coeff
%Key: The logical array has at most 1 in each column 
function [numCycles,cycleIndex] = getNumberOfCycles(logicalArry,cof)
    numCycles = 0;
    cycleIndex = 0;
    for i = 1:length(cof)
        if (any(logicalArry(:,i) == 1))
            numCycles = numCycles + cof(i);
            cycleIndex = [cycleIndex i];
        end
    end
end
%Checks all possible combinations to see if that if they are in
%the polynomial 
function logicalArry = checkPossibleCycles(possibleArray,t)
    [rows,cols] = size(possibleArray);
    maybe = zeros(rows,length(t));
    for i = 1: rows
        maybe(i,:) = has(t,possibleArray(i));
    end
    logicalArry = maybe;
end
%Creates a symbolic element to check
function ret = createCycle(v,c)
    ret = 1;
    for i = 1:length(v)
        ret = c(v(i))*ret;
    end
end
%Generates an Array with entries that list all possible Cycles to check
%for in the polynomial 
function ret = generatePossibleCyclesArray(numCyc,numNodes,c)
    possible = nchoosek(1:numNodes,numCyc);
    [numRows,numCols] = size(possible);
    ret = sym(zeros(numRows,1));
    for i = 1:numRows
        ret(i) = createCycle(possible(i,:),c);
    end
end







