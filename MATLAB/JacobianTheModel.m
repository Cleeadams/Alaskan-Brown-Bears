% Jacobian Matrix of The Autonomous Model

clear
clc
format rational

% Parameters
r_S = 5;
c = .0001;
T_opt = 12.5;

% Growth Rate Dependent on Temperature
R =@(T) log( .32*r_S / ( 1 + c*(T - T_opt)^4 ) );

% Chosed Temp
T = 12.5;

% Theodore Modis Form of Parameters
a1 = R(T);
b1 = a1 / 15;
c1 = .04;
a2 = -.016123;
b2 = a2 / 6;
c2 = .00008;

fprintf(['The water temperature will remain constant at' ...
    ' T=%.1f\n\n'],T)
% Jacobian for critical point (0,0)
fprintf('The Jacobian for the critical point (0,0) is:')
J_1 = [a1, 0; 0, a2];
display(J_1)
    
    % Eigenvalues of J_1
fprintf('The eigenvalues of the Jacobian above are:\n')
disp(eig(J_1))

% Jacobian for critical point (0,K_2)
fprintf('The Jacobian for the critical point (0,%d) is:',a2/b2)
J_2 = [a1-c1*a2/b2, 0; c2*a2/b2, -a2];
display(J_2)

    % Eigenvalues of J_2
fprintf('The eigenvalues of the Jacobian above are:\n')
disp(eig(J_2))

% Jacobian for critical point (K_1,0)
fprintf('The Jacobian for the critical point (%.0f,0) is:',a1/b1)
J_3 = [-a1, -c1*a1/b1; 0, a2+c2*a1/b1];
display(J_3)

    % Eigenvalues of J_3
fprintf('The eigenvalues of the Jacobian above are:\n')
disp(eig(J_3))

% Jacobian for critical point (x*,y*)
x_star = (a1*b2 - c1*a2) / (c1*c2 + b1*b2);
y_star = (a1*c2 + b1*a2) / (c1*c2 + b1*b2);
fprintf('The Jacobian for the critical point (%f,%f) is:',[x_star,y_star])
J_4 = [(-a1*b1*b2+2*b1*c1*a2-b1*c1*a2) / (c1*c2 + b1*b2),...
    (-a1*c1*b2 + c1^2*a2) / (c1*c2 + b1*b2);...
    (a1*c2^2 + b1*a2*c2) / (c1*c2 + b1*b2),...
    (-a2*b1*b2 - 2*a1*b2*c2 + a1*b2*c2) / (c1*c2 + b1*b2)];
display(J_4)

    % Eigenvalues of J_4
fprintf('The eigenvalues of the Jacobian above are:\n')
disp(eig(J_4))








