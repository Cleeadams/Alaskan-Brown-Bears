%Population of salmon at different temperatures

% S = 1000000;
% k = 29100000;

clear
close all
clc

S = 20;
k = 29.1;

time_max = 20;
c = .0001;
T_opt = 12.5;
r = log(0.32*5);

    dS =@(s) r*s*(1-s/k);

    salmon = @(t,s)(dS(s));

    t = 0:.01:time_max;

    [t,pops] = ode45(salmon,t,S);


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pops,'Color',[0.10,0.70,1.00],'LineWidth',4);
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Salmon (millions)", 'FontSize', 25)
str = "The Population of Alaskan Salmon Over Time";
title(str, 'FontSize', 35)
legend('Salmon', 'FontSize', 25, 'Location', 'NorthWest')
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;

ax.GridAlpha = 1;
set(gca,"FontSize",20)



