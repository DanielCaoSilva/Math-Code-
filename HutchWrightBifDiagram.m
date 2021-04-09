%Daniel Silva 
%Modeling  Project - Creating the bifurcation diagram 
%This code was seperated from the rest to allow for more efficiency 
%when computing the bifurcation at large time intervals


%func = @(y,t) 3y(t-2);
clear all;
close all;
clc;

lags = 1;
tf = 1000;
t = linspace(0,tf,10000);

%global iter;
setGlobalIter(1);
%plots = [];
%figure;

diff = [0];
maxUp = [1];
minDown = [1];
lams = [1];
endPos = 100;
for i =1:endPos
    sol = dde23(@ddefun,lags, @yhist,[0 tf]);
%solLin = dde23(@ddefunLin,lags, @yhistLin,[0 tf]);
    
    y = deval(sol,t);
%yLin = deval(solLin,t);
    %disp(getGlobalIter);
    lams = [lams getGlobalIter];
    MyFN = fieldnames(sol);
    yVals = getfield(sol,MyFN{5});
    lg = length(yVals); 
    minVal = min(yVals(lg*.5:lg));
    maxVal = max(yVals(lg*.5:lg));
    diff = [diff (maxVal-minVal)];
    maxUp = [maxUp maxVal];
    minDown = [minDown minVal];
    %pause(.01);
    
    %hold on;
    %plot(t,y);
    hold on;
    plot(lams,diff);
    addGlobalIter();
end
disp(getGlobalIter);

%Bif Diagram
figure;
hold on;
plot(lams,maxUp);
plot(lams,minDown);
title(sprintf('Computed Bifurcation Diagram: %f in time',tf));
    xlabel('lambda');
    ylabel('U');
grid on;
print -deps bif1000



function yp = ddefun(t,y,L)
    %for i =0:.1:1.5
    i = getGlobalIter;
        yp = i*y*(1-L);
    %end
end   
function y = yhist(t)
    y = 0.5;
end
function setGlobalIter(val)
    global iter
    iter = val;
end
function r = getGlobalIter
    global iter
    r = iter;
end
function addGlobalIter()
    global iter
    iter = iter + 0.01;
end