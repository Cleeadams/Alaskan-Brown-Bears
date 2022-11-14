  % Brown Bear Logstic Equation
  
clear
close all
clc
  
% Initial Population
y_0 = 30000;

% r by Van Daele
r_VD = 0.012;
% r by McLellan (Table 2)
r_FV = 0.081;
% r by McLellan
r_M = 0.084;
% r by the average
r_AVG = mean([r_VD,r_FV,r_M]);

% Vector of Growth Rates
r = [r_VD,r_FV,r_M,r_AVG];

% Carrying Capacity
K = 45000;

% Time Intervals
% t = 0:3:120;
t = 0:6:400;


legendNames{1} = 'Van Daele, r_y = 0.012';
legendNames{2} = 'McLellan89, r_y = 0.081';
legendNames{3} = 'McLellan96, r_y = 0.085';
legendNames{4} = 'Average, r_y = 0.044';

% line properties
% List a bunch of markers; they will be selected in 
% order and then the selection will start again if 
% there are more lines than markers.  
markers = {'o','+','*','s','d','v','>','h'};
% List a bunch of colors; like the markers, they 
% will be selected circularly. 
colors = {'b','g','r','k','c','m'};
% Same with line styles
linestyle = {'-','--','-.',':'};
% This function will do the circular selection
% Example:  getprop(colors, 7) = 'b'
getFirst = @(v)v{1}; 
getprop = @(options, idx)getFirst(circshift(options,-idx+1));

% For loop for the different growth rates.
for i = 1:length(r)-1

    % Logistic Function
    h = @(t,y) r(i).*y(1).*(1-(y(1)/K));

    % Solutions to the Function
    [t za] = ode45(h,t,y_0);
    
    % Plots the Function with the chosedn growth rate
    figure(1)
    plot(t,za(:,1),...
        'Marker',getprop(markers,i),...
        'color',getprop(colors,i),...
        'linestyle',getprop(linestyle,i),...
        'LineWidth',1)
    hold on
end
% Plots the Average Growth Rate with a bold line
h = @(t,y) r(4).*y(1).*(1-(y(1)/K));
[t za] = ode45(h,t,y_0);
plot(t,za(:,1),"Color",'c','LineWidth',5)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Brown Bears", 'FontSize', 25)
title("The Population of Alaskan Brown Bears Over Time", ...
    'FontSize', 25)
legend(legendNames, 'FontSize', 20,'Location','SouthEast')
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;

