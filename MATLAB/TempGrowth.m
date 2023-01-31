% Earth Temperature Rate
close all
clear
clc

% claimed that change of .08 degree farenheit per decade.

r_t = 1/60;
K_t = 60;

% Start with exponential.

    % Avg temp in Alaska during spring/summer
temp = (12.8 + 25.6)/2;

dT =@(T) -.7*T/(2*i) + 1/(2*T*1);
t = 0:.5:100;

%dtemp = @(t,y)[r_t.*y(1).*(1-y(1)./K_t)];
dtemp = @(t,T)[dT(T)]
[t y] = ode45(dtemp,t,[temp]);

figure(1)
plot(t,y(:,1),'b')



