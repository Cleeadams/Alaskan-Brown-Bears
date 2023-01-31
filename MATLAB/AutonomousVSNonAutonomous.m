% Autonomous Vs Non-Autonomous

clc
clear
close all

    % Parameters
% Growth Rates
r_y = .059;
r_x = 5;

% Carry Capacity
K_y = 5;
K_x = 15;

% Initial Populations
x_o = 5;
y_o = 3;

% Interaction Terms
c_x = 0.0627;
c_y = 0.0313;

    % Try these Parameters to see something a bit more realistic
% c_x = .02;
% c_y = .0008;

% Time Duraction.
t=[0 250];

% Growth Rate Function Parameters
c = .0001;
T_opt = 12.5; % Celsius

% Temperature
T = 12.5;

% Growth Rate Function
R =@(T) log( .32*r_x / ( 1 + c*(T - T_opt)^4 ) );
r = R(T);

% Bear ODE
dy =@(y) r_y.*y(2).*(1 - ( y(2)./K_y ) ) + c_y.*y(2).*y(1);

% Salmon ODE
dx =@(t,y) r .* y(1)*( 1 - ( y(1)./K_x ) ) - c_x.*y(2).*y(1);

% Autonomous System of ODE Function
MODEL = @(t,y) [dx(t,y); dy(y)];

% Solutions to the Autonomous System of ODE
[t,pop] = ode15s(MODEL, t, [x_o, y_o]);

% Plotting the Autonomous System Over the Time
figure(1)
plot(t, pop(:,1), 'b--', 'LineWidth', 4)
hold on
plot(t, pop(:,2), 'r', 'LineWidth', 4)
grid on
ylim([0,11])
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel("Time (yrs)","Interpreter","Latex", 'FontSize', 25)
ylabel("Population","Interpreter","Latex", 'FontSize', 25)
% str = "Autonomous and Non-Autonomous Model";
% title(str,"Interpreter","Latex", 'FontSize', 25)

% ============================================================

% ============================================================

    % Non-autonomous

% Bear ODE
dy =@(y) r_y.*y(2).*(1 - ( y(2)./K_y ) ) + c_y.*y(2).*y(1);

% Salmon ODE
dx =@(t,y) (log(8/(5*(((2*t)/25 - 74/25)^4/10000 + 1))) -...
    (4*t*((2*t)/25 - 74/25)^3*(((2*t)/25 - 74/25)^4/16000 +...
    5/8))/(78125*(((2*t)/25 - 74/25)^4/10000 + 1)^2)).* y(1)*( 1 -...
    ( y(1)./K_x ) ) - c_x.*y(2).*y(1);

% Non-Autonomous System of ODE Function
MODEL = @(t,y) [dx(t,y); dy(y)];

% Solutions to the Non-Autonomous System of ODE
[t,pop] = ode15s(MODEL, t, [x_o, y_o]);

% Plotting the Non-Autonomous Model on top of Figure 1
figure(1)
plot(t, pop(:,1),'g:', 'LineWidth', 4)
hold on
plot(t, pop(:,2),'k-.', 'LineWidth', 4)
legend('Salmon (Auto)', 'Brown Bear (Auto)', 'Salmon (Non)', ...
    'Brown Bear (Non)', 'FontSize', 25, 'Location', 'NorthEast')




