clear all;
close all;
clc;

x=input('enter a value:');
a=1;
for ii=1:x;
    %x=x-1;
    a=ii*a;
    
end
fprintf('The factorial is %d\n',a);

