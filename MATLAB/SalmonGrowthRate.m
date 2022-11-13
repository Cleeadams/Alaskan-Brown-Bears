% Exponential Decay Model for Fish.

close all
clear
clc

    % N_t = N_0 e^(-kt)

    % dN/dt = r*N_t
N = 20;
r = log(.32*5);
% K = 20000;

t = 0:.01:10;

h = @(t,y)(r.*y(1));
[t, za] = ode45(h,t,N);
% h2 = @(t,y)(r.*y(1).*(1-(y(1)/K)));
% [t,ze] = ode45(h2,t,N);

figure(1)
plot(t,za(:,1),'c','LineWidth',4)
% hold on
% plot(t,ze(:,1),'r')
% hold off
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




