% Simple predator prey model
close all
clear
clc

% Initial conditions for prey(N) and predator(P)
N = 20;
P = 20;
% Parameters for interaction rate(a) and birth rate(b)
a = .1;
b = .02;
c = .01;
d = .2;
% Time duration of 0 to 15 years
t=0:.01:20;
% rate of change betweem prey(dN) and predator(P)
dN =@(y)(a - b*y(2))*y(1);
dP =@(y)(c*y(1) - d)*y(2);
% System of ODE function
model2 = @(t,y)[dN(y); dP(y)];
% System of ODE solver
[t,pop] = ode45(model2,t,[N;P]);
% Plotting the population over the time duration
figure(1)
plot(t,pop)
grid on

figure(2)
plot(pop(:,1),pop(:,2))






