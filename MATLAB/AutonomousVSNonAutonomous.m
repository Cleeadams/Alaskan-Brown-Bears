% Autonomous Vs Non-Autonomous

clc
clear
close all

    % Parameters
% Reproduction rates
r_B = .044;
r_S = 5;

% Carry capacity
K_B = 5;
K_S = 15;

% Initial populations
S_o = 5;
B_o = 3;

% Interaction terms
c_S = 0.0627;
c_B = 0.0313;
% c_S = .02;
% c_B = .0008;

% Time duration starting at 1990.
t = [0 250];

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
dB =@(y) r_B.*y(2).*(1 - ( y(2)./K_B ) ) + c_B.*y(2).*y(1);

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
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population", 'FontSize', 25)
str = "Autonomous and Non-Autonomous Model";
title(str,"Interpreter","Latex", 'FontSize', 35)


    % Non-autonomous

% Bear ODE
dB =@(y) r_B.*y(2).*(1 - ( y(2)./K_B ) ) + c_B.*y(2).*y(1);

% Salmon ODE
% dS =@(t,y) (R(t)-d).*s.*(1-s/k);
dS =@(t,y) (log(8/(5*(((2*t)/25 - 74/25)^4/10000 + 1))) -...
    (4*t*((2*t)/25 - 74/25)^3*(((2*t)/25 - 74/25)^4/16000 +...
    5/8))/(78125*(((2*t)/25 - 74/25)^4/10000 + 1)^2)).* y(1)*( 1 -...
    ( y(1)./K_S ) ) - c_S.*y(2).*y(1);

% System of ODE function
MODEL = @(t,y) [dS(t,y); dB(y)];

% % System of ODE solver
[t,pop] = ode15s(MODEL, t, [S_o, B_o]);
% 
% % Plotting the population over the time duration
figure(1)
plot(t, pop(:,1),'g:', 'LineWidth', 4)
hold on
plot(t, pop(:,2),'k-.', 'LineWidth', 4)
legend('Salmon (Auto)', 'Brown Bear (Auto)', 'Salmon (Non)', ...
    'Brown Bear (Non)', 'FontSize', 25, 'Location', 'NorthEast')




