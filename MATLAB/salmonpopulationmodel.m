%Population of salmon

S = 1000000;
k = 30000000;

c = 1 / 501;
b = .08;


R =@(t) 1 / (1 + c*(b*t-6.2)^4);
r = .5;
dS =@(s) r*s*(1-s/k);

salmon = @(t,s)(R(t)*dS(s));

t = 0:.01:2000;

[t,pop] = ode45(salmon,t,S);


% Plotting the population over the time duration
figure(1)
plot(t,pop)
grid on

