% Exponential Growth Model for Salmon.

close all
clear
clc

    % dx/dt = r*x_0

% Parameters
x = 20;
r = log(.32*5);

t = 0:.01:10;

% Exponential ODE set up
h = @(t,y)(r.*y(1));

% Solutions to the eponential ODE
[t, za] = ode45(h,t,x);

% Plot of the exponential growth model
figure(1)
plot(t,za(:,1),'c','LineWidth',4)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population", 'FontSize', 25)
title("The Population of Salmon Over Time", 'FontSize', 25)
legend('Exponential', 'FontSize', 20, 'Location', 'NorthWest')
grid on
grid minor
ax = gca;
ax.GridAlpha = 1;
ax.MinorGridAlpha = 1;
set(gca,'FontSize',20)




