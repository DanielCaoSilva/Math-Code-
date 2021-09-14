clear all;
close all;
clc;

%Bifurcation for a single oscillator
xvals = [];

for mu = 0:.001:2
    %mu
    %xold = .45;
    xold = 0;
%    Transient
    for i = 1:5000
        xnew = 1-mu*xold*xold;
        %xnew = xold*exp(mu-xold^2); %xk+1 = xk somthing
        xold = xnew;
    end
%    xnew = xold;
    xss = xnew;
    for i = 1:10000
        %xnew = xold*exp(mu-xold^2);
        xnew = 1-mu*xold*xold;
        xold = xnew;
        xvals(1,length(xvals)+1) = mu;
        xvals(2,length(xvals)) = xnew;
        if (abs(xnew-xss)<.001)
            break;
        end
    end
end

plot(xvals(1,:),xvals(2,:),'.','LineWidth',.1,'MarkerSize',1.2);
set(gca,'color','k','xcolor','w','ycolor','w');
set(gcf,'color','k');
xlabel('a-vals');
ylabel('xpoints');