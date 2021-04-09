%Daniel Silva 
%Modeling  Project - Logistic equation with delay 
%This code generates a gif that iterates lamda and uses DDE23 to solve 
%the logistic equation with delay
%It also generates the bifurcation diagram associated with it. 
%Other plots can be used, but parts of the code were commented out for 
%time efficiency when run over again.  

clear all;
close all;
clc;

%Lags 
lags = 1;
%How far in time it will cacluate for the gif and bif diagram
tf = 100;
t = linspace(0,tf,1000);

%Initaially setting the Lambda value
setGlobalIter(1);

%Initializing arrays for bifurcation diagram
eqPts = [1];
maxUp = [1];
minDown = [1];
lams = [1];
endPos = 120;

%Getting the GIF
h = figure;
axis tight manual 
filename = 'testAnimated.gif';
%iterates values of lambda to create gif and bif diagram
for i =1:endPos
    sol = dde23(@ddefun,lags, @yhist,[0 tf]);
    y = deval(sol,t);
    lams = [lams getGlobalIter];
    MyFN = fieldnames(sol);
    yVals = getfield(sol,MyFN{5});
    lg = length(yVals); 
    %Searches over the second half of the time interval
    minVal = min(yVals(lg/2:lg));
    maxVal = max(yVals(lg/2:lg));
    %eqPts = [eqPts (minVal+maxVal)/2];
    maxUp = [maxUp maxVal];
    minDown = [minDown minVal];
     
    %Plots and sets up gif for animation 
    p = plot(t,y);
    drawnow
    title(sprintf('Computed DDE23 Plot: lamda = %f',getGlobalIter));
        xlabel('x(time)');
        ylabel('y');
    grid on;
    %pause(.01);
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1 
        imwrite(imind,cm,filename,'gif','Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
    %Checking for end condition (used in testing)
    if(i ~= endPos)
        delete(p);
    end

    addGlobalIter();
end
disp(getGlobalIter);

%DDE at pi/2
testLam = (pi/2)+.01;
setGlobalIter(testLam);
disp(getGlobalIter);
tf2 = 2000;
sol = dde23(@ddefun,lags, @yhist,[0 tf2]);
t2 = linspace(0,tf2,1000);
y = deval(sol,t2);
%solLin = dde23(@ddefunLin,lags, @yhistLin,[0 tf]);
hold on;
figure;
plot(t2,y);
title(sprintf('Computed DDE23 Plot: lamda = %d',testLam));
    xlabel('x(time)');
    ylabel('y');
%axis([0 3 0 15]);
grid on;
print -deps lampi2plus1
disp(getGlobalIter);

%Bif Diagram
MyFN = fieldnames(sol);
yVals = getfield(sol,MyFN{5});
minVal = min(yVals(150:length(yVals)));
maxVal = max(yVals(150:length(yVals)));
figure;
hold on;
%plot(lams,eqPts);
plot(lams,maxUp);
plot(lams,minDown);

%Logistic DDE 
function yp = ddefun(t,y,L)
    %for i =0:.1:1.5
    i = getGlobalIter;
        yp = i*y*(1-L);
    %end
end   
function y = yhist(t)
    y = 0.5;
end
%Linear DDE used in testing 
function yp = ddefunLin(t,y,L)
    yp = -1*L;
end
function y = yhistLin(t)
    y = 0.5;
end
%Functions used for the lambda interations 
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