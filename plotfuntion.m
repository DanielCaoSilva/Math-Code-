function plotfuntion(func, points)
%function c = plotfunction(func, points) this is the same as above 

%this function plots any function (a function handle)
%For specific points 

%check for number of inputs arguments 
message = nargchk(2,2,nargin);
%minargs=2;
%maxargs=2;
error(message);

%get the function 
fname = func2str(fun);

%plot the function 
plot(points, func(points))


