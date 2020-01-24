t0 = zeros(1,100);
t1 = zeros(1,100);
for n = 1:100
    A = rand(n);
    B = rand(n);
    C = rand(n,1);
    tic;
    %x = (A*B)*C;
    %t0(n) = toc;
    y =(B*C);
    out = A*y;
    t1(n) = toc;
    
end
%plot(t0);
%plot(t1);
%plot(1:100,t0,'k-','LineWidth',3)
%plot(1:100,t1,'k--','LineWidth',3)
a = [1,2;3,4];
b = [5,6;0,8];
c = [9,10;0,12];
d = [13,14;0,16];
h = [1,2,5,6;3,4,7,8;9,10,13,14;11,12,15,16];
hnew = [a,b;c,d];
x11 = -inv(c)*d*inv(-a*inv(c)*d+b);
x21 = inv(-a*inv(c)*d+b);
x12 = -inv(a)*b*inv(-c*inv(a)*b+d);
x22 = inv(-c*inv(a)*b+d);
%hmaybe = [-inv(c)*d*inv(-a*inv(c)*d+b),-inv(a)*b*inv(-c*inv(a)*b+d);inv(-a*inv(c)*d+b),inv(-c*inv(a)*b+d)]
%inv(h)
inv(hnew)
myh = [x11,x12;x21,x22]







