% Reproduction function

clc
clear
close all

r = 5;
d = .32;
c = 10e-4;
a = .08;
b = 2.96;
S_o = 10;

syms t

R = d*r / (1 + c*(a*t-b)^4);

R_prime = gradient(R,t);

f = log(R) + R_prime*t/R;


% Plotting
t = -15:.1:72;
plot(t, subs(f,t),'LineWidth',4)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Reproduction Rate", 'FontSize', 25)
title('Reproduction Rate Vs Time', "FontSize",20)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;
set(gca,"FontSize",20)




