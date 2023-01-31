% Water Temperature Trend

clear
close all

a = .08;
b = 9.54;

t = [0 100];

T = a*t + b;

figure(1)
plot(t,T,'LineWidth',4)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Temperature (Celsius)", 'FontSize', 25)
title('Water Temperature Vs Time', "FontSize",20)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;
set(gca,"FontSize",20)