function h = nmsig(g,gp,e)
e=10;
for i= 1:e
    h(1)=1;
    g(i)=(h(i)^2)-2;
    %syms h;
    %gp(i)=diff(g,h);
    gp(i)=2*h(i);
    h(i+1)=h(i)-(g(i)/gp(i));
end
disp(h);
figure 
x=1:11;
plot(x,h,'-o');
end