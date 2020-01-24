alpha=2;
beta=1;
gamma=1; 
xhist=5; % constant history for x(t) up to time 0
tau1=0.1; % incubation period (increase for ex to 1)
tau2=0.1; % back to previous generation (increase for ex to 2)
T=30; % solving out to time T
rhs1=@(t,x,z) alpha*z(1,1)-beta*x-gamma*z(1,2)*x ; % x is x(t); z(1) is x(t-tau1); z(2) is x(t-tau2);
sol=dde23(rhs1,[tau1, tau2],xhist,[0,T]); % dde23 is the delay diff eqns solver
plot(sol.x,sol.y,'r-','LineWidth',2) % sol.x and sol.y are row vectors for time t and variable x(t) respectively