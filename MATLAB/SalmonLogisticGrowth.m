% Salmon Logistic Growth

clear
close all
clc

% Parameters
x_0 = 20;
k = 29.1;
r = log(0.32*5);
time_max = 20;

t = 0:.01:time_max;

% Logistic Function
dx =@(x) r*x*(1-x/k);

salmon = @(t,x)(dx(x));

% Solutions to the Function
[t,pops] = ode45(salmon,t,x_0);


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pops,'Color',[0.10,0.70,1.00],'LineWidth',4);
set(gca,"FontSize",20)
xlabel("Time (yrs)",'Interpreter','latex', 'FontSize', 25)
ylabel("Population (millions)",'Interpreter', ...
    'latex', 'FontSize', 25)
str = "The Population of Alaskan Salmon Over Time";
% title(str,'Interpreter','latex', 'FontSize', 25)
legend('Salmon', 'FontSize', 25, 'Location', 'NorthWest')
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;

ax.GridAlpha = 1;




