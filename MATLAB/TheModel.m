% Analysis of the final model
    % Please note that 1990 will be our starting year.

clc
clear
close all

    % Parameters
% Reproduction rates
r_B = .016123;
r_S = 5;

% Carry capacity
K_B = 6;
K_S = 150;

% Initial populations
B_o = 3;
S_o = 100;

% Interaction terms
c_B = 0.00008;
c_S = 0.04;

% Time duration starting at 1990.
t=[0 400];

% Reproduction function parameters
c = .0001;
T_opt = 12.5; % Celsius

% Temperature function parameters
r_T = 0.08;
b_T = 9.54;


    % Functions
% Temperature function
% T=@(t) r_T * t + b_T;
T = 12.5;

% Reproduction function
R =@(T) log( .32*r_S / ( 1 + c*(T - T_opt)^4 ) );
r = R(T);

% Bear ODE
dB =@(y) c_B.*y(2).*y(1) - r_B.*y(2).*(1 - ( y(2)./K_B ) );

% Salmon ODE
% dS =@(t,y) (R(t)-d).*s.*(1-s/k);
dS =@(t,y) r .* y(1)*( 1 - ( y(1)./K_S ) ) - c_S.*y(2).*y(1);

% System of ODE function
MODEL = @(t,y) [dS(t,y); dB(y)];

% % System of ODE solver
[t,pop] = ode15s(MODEL, t, [S_o, B_o]);
% 
% % Plotting the population over the time duration
figure(1)
plot(t, pop(:,1), 'b--', 'LineWidth', 4)
hold on
plot(t, pop(:,2), 'r', 'LineWidth', 4)
hold off
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population", 'FontSize', 25)
str = "The Population of Alaskan Salmon and Brown Bears Over Time";
title(str,"Interpreter","Latex", 'FontSize', 35)
grid on
legend('Salmon', 'Brown Bear', 'FontSize', 25, 'Location', 'NorthEast')
ax = gca;
grid on
% grid minor
% ax.MinorGridAlpha = 1;




