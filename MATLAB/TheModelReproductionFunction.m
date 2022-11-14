% Solutions to the Non-autonomous Model

clc
clear
close all

    % Parameters
% Growth Rates
r_y = .044;
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

% Bear ODE
dy =@(y) r_y.*y(2).*(1 - ( y(2)./K_y ) ) + c_y.*y(2).*y(1);

% Salmon ODE
dx =@(t,y) (log(8/(5*(((2*t)/25 - 74/25)^4/10000 + 1))) -...
    (4*t*((2*t)/25 - 74/25)^3*(((2*t)/25 - 74/25)^4/16000 +...
    5/8))/(78125*(((2*t)/25 - 74/25)^4/10000 + 1)^2)).*...
    y(1)*( 1 - ( y(1)./K_x ) ) - c_x.*y(2).*y(1);

% Non-Autonomous System of ODE Function
MODEL = @(t,y) [dx(t,y); dy(y)];

% Solutions to the Non-Autonomous System of ODE
[t,pop] = ode15s(MODEL, t, [x_o, y_o]);

% Plotting the Non-Autonomous System Over the Time
figure(1)
plot(t, pop(:,1),'b--', 'LineWidth', 4)
hold on
plot(t, pop(:,2),'r', 'LineWidth', 4)
hold off
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population", 'FontSize', 25)
str = "The Non-Autonomous Model";
title(str,"Interpreter","Latex", 'FontSize', 35)
legend('Salmon', 'Brown Bear', 'FontSize', 25, 'Location', 'NorthEast')

% ============================================================

% ============================================================

% List for Cycling Through Different Line Styles
styles = ['-',"--",':','-.'];
i = 1;
% Plotting the Non-Autonomous Model with Different Initial 
% Populations
for y = 1:2:3
    for x = 3:2:5
        % Solutions to the Non-Autonomous System
        [t,Y] = ode45(MODEL, t, [x, y]);

        % Creates vector field
        figure(2)
        plot(Y(:,1),Y(:,2),'LineWidth',4,'LineStyle',styles(i))
        hold on
        i = i + 1;
    end
end
for y = 1:2:3
    for x = 3:2:5
        % Plots the Initial Populations
        plot(x,y,'ko','MarkerSize',12,'MarkerFaceColor','k')
        hold on
    end
end
% Plots the Critical Point
plot(0,K_y,'ko','MarkerSize',12,'MarkerFaceColor','k')
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel('x (Salmon)', 'FontSize', 25)
ylabel('y (Bears)', 'FontSize', 25)
title('Solutions For The Non-Autonomous Model', 'FontSize', 25)
legend('$(3,\;1)$', '$(5,\;1)$', '$(3,\;3)$',...
    '$(5,\;3)$',...
    'Interpreter', 'Latex', 'FontSize', 20, 'Location', 'NorthEast')
xlim([0,9])
ylim([0,12])




