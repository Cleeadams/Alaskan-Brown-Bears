% Growth Rate Function

clc
clear
close all

% Parameters
r = 5;
d = .32;
c = 1e-4;
a = .08;
% Temp Intercept - T_opt
b = 2.96;
x_o = 10;

% Allows for symbolic function to be created
syms t

% Symbolic Proportion Function with Respect to Time
R = d*r / (1 + c*(a*t-b)^4);

% Derivative of the Proportion Function with Respect to Time
R_prime = diff(R,t);

% Growth Rate Function Dependent on Time
f = log(R) + R_prime*t/R;


% Plotting the Growth Rate Function
t = 0:1:150;
plot(t, subs(f,t),'LineWidth',4)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Growth Rate", 'FontSize', 25)
title('Growth Rate Function', "FontSize",30)
ylim([-2.5,.55])




