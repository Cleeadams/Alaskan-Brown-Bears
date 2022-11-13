% Reproduction function

clc
clear
close all

r = 5;
d = .32;
c = 1e-4;
a = .08;
b = 2.96;
S_o = 10;

syms t

R = d*r / (1 + c*(a*t-b)^4);

R_prime = diff(R,t);

f = log(R) + R_prime*t/R;


% Plotting
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




