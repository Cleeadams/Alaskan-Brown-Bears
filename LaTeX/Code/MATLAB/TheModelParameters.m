% Solutions to the Autonomous Model with Different 
% Interaction Parameters

clc
clear
close all

    % Parameters
% Growth Rates
r_y = .059;
r_x = 5;

% Carry capacity
K_y = 5;
K_x = 15;

% Initial populations
x_o = 5;
y_o = 3;

% Time duration starting at 1990.
t=[0 250];

% Reproduction function parameters
c = .0001;
T_opt = 12.5; % Celsius

    % Functions
% Temperature function
T = 12.5;

% Growth Rate function
R =@(T) log( .32*r_x / ( 1 + c*(T - T_opt)^4 ) );
r = R(T);

% Interaction parameters
cMat = [0.02, .008; 0.09, .008; 0.09, .082; 0.0627, .0313];
styles = ['-',"--",':','-.'];

for i = 1:4
    % Bear ODE
    dy =@(y) r_y.*y(2).*(1 - ( y(2)./K_y ) ) +...
        cMat(i,2).*y(2).*y(1);
    
    % Salmon ODE
    dx =@(t,y) r .* y(1)*( 1 - ( y(1)./K_x ) ) -...
        cMat(i,1).*y(2).*y(1);
    
    % Autonomous System of ODE function
    MODEL = @(t,y) [dx(t,y); dy(y)];

    [t,Y] = ode45(MODEL, t, [x_o, y_o]);

    % Creates vector field
    figure(2)
    plot(Y(:,1),Y(:,2),'LineWidth',4,'LineStyle',styles(i))
    hold on

end
for i = 1:4
    % Critical Points
    x_crit = (r*r_y/K_y - cMat(i,1)*r_y) /...
        (cMat(i,1)*cMat(i,2) + (r/K_x)*(r_y/K_y));
    y_crit = (r*cMat(i,2) + r/K_x*r_y) /...
        (cMat(i,1)*cMat(i,2) + (r/K_x)*(r_y/K_y));
    
    % Plots Critical Points
    plot(x_crit,y_crit,'ko','MarkerSize',8,'MarkerFaceColor','k')
    hold on
end
% Plots the Initial Populations
plot(x_o,y_o,'ko','MarkerSize',12,'MarkerFaceColor','k')
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlim([0,14]);
ylim([2,13]);
xlabel('x (Salmon)','Interpreter', 'Latex', 'FontSize', 25)
ylabel('y (Bears)','Interpreter', 'Latex', 'FontSize', 25)
title('Solutions For The Autonomous Model','Interpreter', ...
    'Latex', 'FontSize', 25)
legend('$c_{xy}=0.02,\;c_{yx}=0.008$', ...
    '$c_{xy}=0.09,\;c_{yx}=0.008$', ...
    '$c_{xy}=0.09,\;c_{yx}=0.082$', ...
    '$c_{xy}=0.0627,\;c_{yx}=0.0313$',...
    'Interpreter', 'Latex', 'FontSize', 20, ...
    'Location', 'NorthEast')



