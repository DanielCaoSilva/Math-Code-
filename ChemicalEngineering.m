clear all; 
close all;
clc;


k1=1^-1;
k2=2^-1;
t_span= [0 5];
Ca=5;
Cb=0;
Cc=0;
dCa=@func1;
dCb=@func1;
[t,y]=ode45(dCa,t_span,Ca);
[t1,y2]=ode45(dCb,t_span,Ca,Cb);

plot(t,y)
plot(t1,y2)
