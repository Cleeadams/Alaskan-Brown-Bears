% Non-autonomous Model

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
c_S = .0627;
c_B = .0313;
% c_S = .02;
% c_B = .0008;

% Time duration starting at 1990.
t=[0 250];

% Reproduction function parameters
c = .0001;
T_opt = 12.5; % Celsius

% Temperature function parameters
r_T = .08;
b_T = 9.54;


    % Functions
% Temperature function
T=@(t) r_T * t + b_T;

% Reproduction function
R=@(t) log( .32*r_S / ( 1 + c*(r_T * t + b_T - T_opt)^4 ) );

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
styles = ['-',"--",':','-.'];
i = 1;
for B = 1:2:3
    for S = 3:2:5
        [t,Y] = ode45(MODEL, t, [S, B]);

        % Creates vector field
        figure(2)
        plot(Y(:,1),Y(:,2),'LineWidth',4,'LineStyle',styles(i))
        hold on
        i = i + 1;
    end
end
for B = 1:2:3
    for S = 3:2:5
        plot(S,B,'ko','MarkerSize',12,'MarkerFaceColor','k')
        hold on
    end
end
plot(0,K_B,'o','MarkerSize',12,'MarkerFaceColor','k')
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




