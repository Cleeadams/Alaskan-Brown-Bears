% Solutions to the Autonomous Model

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

% Growth Rate function
R =@(T) log( .32*r_x / ( 1 + c*(T - T_opt)^4 ) );
r = R(T);

% Bear ODE
dy =@(y) r_y.*y(2).*(1 - ( y(2)./K_y ) ) + c_y.*y(2).*y(1);

% Salmon ODE
dx =@(t,y) r .* y(1)*( 1 - ( y(1)./K_x ) ) - c_x.*y(2).*y(1);

% System of ODE function
MODEL = @(t,y) [dx(t,y); dy(y)];

% System of ODE solver
[t,pop] = ode15s(MODEL, t, [x_o, y_o]);

% Plotting the Autonomous System Over the Time
figure(1)
plot(t, pop(:,1), 'b--', 'LineWidth', 4)
hold on
plot(t, pop(:,2), 'r', 'LineWidth', 4)
hold off
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel("Time (yrs)","Interpreter","Latex", ...
    'FontSize', 25)
ylabel("Population","Interpreter","Latex", ...
    'FontSize', 25)
str = "The Autonomous Model";
title(str,"Interpreter","Latex", 'FontSize', 25)
legend('Salmon', 'Brown Bear', 'FontSize', 25, ...
    'Location', 'NorthEast')

% ============================================================

% ============================================================

% Plotting the Autonomous Model with Different Initial Populations
for y = 1:2:3
    for x = 3:2:5
        % Solutions to the Autonomous System
        [t,Y] = ode45(MODEL, t, [x, y]);

        % Creates vector field
        figure(2)
        plot(Y(:,1),Y(:,2),'LineWidth',4)
        hold on
    end
end
for y = 1:2:3
    for x = 3:2:5
        % Plots the Initial Populations
        figure(2)
        plot(x,y,'ko','MarkerSize',8,'MarkerFaceColor','k')
        hold on
    end
end
% Plots the Critical Point
plot(0.79,7.1,'ko','MarkerSize',12,'MarkerFaceColor','k')
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel('x (Salmon)',"Interpreter","Latex", ...
    'FontSize', 25)
ylabel('y (Bears)',"Interpreter","Latex", ...
    'FontSize', 25)
title('Solutions For The Autonomous Model', ...
    'FontSize', 25)
legend('$(3,\;1)$', '$(5,\;11)$', '$(3,\;3)$','$(5,\;3)$', ...
    'Interpreter', 'Latex', 'FontSize', 20,...
    'Location', 'NorthEast')




