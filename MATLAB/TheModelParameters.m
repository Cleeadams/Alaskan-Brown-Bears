% 

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

% Time duration starting at 1990.
t=[0 250];

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


% ============================================================

% ============================================================
% Interaction parameters
cMat = [0.02, .008; 0.09, .008; 0.09, .082; 0.0627, .0313];
styles = ['-',"--",':','-.'];

for i = 1:4
    % Bear ODE
    dB =@(y) r_B.*y(2).*(1 - ( y(2)./K_B ) ) + cMat(i,2).*y(2).*y(1);
    
    % Salmon ODE
    % dS =@(t,y) (R(t)-d).*s.*(1-s/k);
    dS =@(t,y) r .* y(1)*( 1 - ( y(1)./K_S ) ) - cMat(i,1).*y(2).*y(1);
    
    % System of ODE function
    MODEL = @(t,y) [dS(t,y); dB(y)];

    [t,Y] = ode45(MODEL, t, [S_o, B_o]);

    % Creates vector field
    figure(2)
    plot(Y(:,1),Y(:,2),'LineWidth',4,'LineStyle',styles(i))
    hold on

end
for i = 1:4
    % Critical Points
    x_crit = (r*r_B/K_B - cMat(i,1)*r_B) / (cMat(i,1)*cMat(i,2) + (r/K_S)*(r_B/K_B));
    y_crit = (r*cMat(i,2) + r/K_S*r_B) / (cMat(i,1)*cMat(i,2) + (r/K_S)*(r_B/K_B));
    
    plot(x_crit,y_crit,'ko','MarkerSize',8,'MarkerFaceColor','k')
    hold on
end
plot(S_o,B_o,'ko','MarkerSize',12,'MarkerFaceColor','k')
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlim([0,12]);
ylim([2,13]);
xlabel('x (Salmon)', 'FontSize', 25)
ylabel('y (Bears)', 'FontSize', 25)
title('Solutions For The Autonomous Model', 'FontSize', 25)
legend('$(0.02,\;0.008)$', '$(0.09,\;0.008)$', '$(0.09,\;0.082)$',...
    '$(0.0627,\;0.0313)$',...
    'Interpreter', 'Latex', 'FontSize', 20, 'Location', 'NorthEast')



