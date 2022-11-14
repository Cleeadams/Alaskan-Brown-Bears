% Determine the Stability of the Autonomous Model

clear
clc
close all

format long

% Growth Rate Dependent on Temperature
R =@(T) log( .32*5 / ( 1 + .0001*(T - 12.5)^4 ) );

% Parameters
T = 12.5;
k1 = 15;
k2 = 5;

a1 = R(T);
b1 = a1 / k1;

a2 = .044;
b2 = a2 / k2;

% Symbolic Values for the Interaction Parameters and Populations
syms c1 c2 x y

% Autonomous System of ODEs
f1 = a1*x - b1*x^2 - c1*x*y;
f2 = a2*y - b2*y^2 + c2*x*y;

    % Critical Values

x_crit = (a1*b2 - c1*a2) / (c1*c2 + b1*b2);
% To keep x_crit within constraints: c1 < a1*b2/a2 = a1/k2
y_crit = (a1*c2 + b1*a2) / (c1*c2 + b1*b2);
% To keep y_crit within constraints: c2 > -b1*a2/a1 = -a2/k1

% By setting Tau = 0, we can solve for c2 with any c1 value
c_1 = 0:.001:a1*b2/a2;
c_2 = ( b1*c_1*a2 - a1*b1*b2 - b1*b2*a2 ) / (a1*b2);

% Jacobian Matrix
A = [diff(f1,x), diff(f1,y);...
    diff(f2,x), diff(f2,y)];

% The Trace of the Jacobian
Tau = trace(A);

% Trace at the Critical Point Chosen
Tau = subs(Tau,[x,y],[x_crit,y_crit]);

% Create Meshgrid of Interaction Parameters
[C1, C2] = meshgrid(0:.002:a1*b2/a2,0:.002:a1*b2/a2);

% Sub in the Interaction Parameters
Tau = subs(Tau,[c1,c2],{C1,C2});

% Plotting the Trace with a Meshgrid of c_xy and c_yx values
figure(2)
surf(C1,C2,double(Tau))
hold on
% Plot of the Triangle
zz = zeros(length(c_1),1);
vv = a1*b2/a2 * ones([length(c_1),1]);
plot3(c_1,c_1,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3(vv,c_1,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3(c_1,zz,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3((2/3)*a1*b2/a2,(1/3)*a1*b2/a2,0,'ko','MarkerSize',10, ...
    'MarkerFaceColor','k')
hold on
plot3(.02,.008,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
hold on
plot3(.09,.008,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
hold on
plot3(.09,.082,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
xlim([0,a1*b2/a2])
ylim([0,a1*b2/a2])
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
title('\textbf{Trace: T}','Interpreter','Latex', ...
    'FontSize',25)
xlabel('$c_{xy}$','Interpreter','Latex','FontSize',30)
ylabel('$c_{yx}$','Interpreter','Latex','FontSize',30)
zlabel('\textbf{T}','Interpreter','Latex','FontSize',22)

% The Determinate of the Jacobian
D = det(A);

% Determinate at the Critical Point Chosen
D = subs(D,[x,y],[x_crit,y_crit]);

% Sub in the Interaction Parameters
D = subs(D,[c1,c2], {C1,C2});

% Discriminant
F = double(Tau) - 4*double(D);

% Plotting the Discriminant with a Meshgrid of c_xy and c_yx values
figure(3) 
surf(C1,C2,F)
hold on
% Plot of the triangle
plot3(c_1,c_1,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3(vv,c_1,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3(c_1,zz,zz,'LineWidth',6,'Color','k','LineStyle','--')
hold on
plot3((2/3)*a1*b2/a2,(1/3)*a1*b2/a2,0,'ko','MarkerSize',10, ...
    'MarkerFaceColor','k')
hold on
plot3(.02,.008,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
hold on
plot3(.09,.008,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
hold on
plot3(.09,.082,0,'k.','MarkerSize',10,'MarkerFaceColor','k', ...
    'Marker','square')
xlim([0,a1*b2/a2])
ylim([0,a1*b2/a2])
grid on
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
grid minor
ax.MinorGridAlpha = 1;
xlabel('$c_{xy}$','Interpreter','Latex','FontSize',30)
ylabel('$c_{yx}$','Interpreter','Latex','FontSize',30)
zlabel('$\textbf{T}^2-4$\textbf{D}','Interpreter','Latex', ...
    'FontSize',22)
title('\textbf{Discriminant: T$^2-4$D}','Interpreter','Latex', ...
    'FontSize',25)














