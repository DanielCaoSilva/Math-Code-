function plotfunction(func, points)
%function c = plotfunction(func, points) this is the same as above 

%this function plots any function (a function handle)
%For specific points 

%check for number of inputs arguments 
narginchk(2,2);
%minargs=2;
%maxargs=2;
%error(message);

%get the function 
fname = func2str(func);

%plot the function 
plot(points, func(points))


