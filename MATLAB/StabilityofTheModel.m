
clear
clc
close all

format long

% Parameters
R =@(T) log( .32*5 / ( 1 + .0001*(T - 12.5)^4 ) );

T = 12.5;
k1 = 10;
k2 = 5;

a1 = R(T);
b1 = a1 / k1;

a2 = .016123; % Making the reproduction rate for brown bears positive.
b2 = a2 / k2;

syms c1 c2 x y

% First Solve for the critical values

f1 = a1*x - b1*x^2 - c1*x*y;
f2 = a2*y - b2*y^2 + c2*x*y;

x_crit = (a1*b2 - c1*a2) / (c1*c2 + b1*b2);
% To keep x_crit within constraints: c1 < a1*b2/a2 = a1/k2
y_crit = (a1*c2 + b1*a2) / (c1*c2 + b1*b2);
% To keep y_crit within constraints: c2 > -b1*a2/a1 = -a2/k1

% By setting Tau = 0, we can solve for c2 with any c1 value
c_1 = 0:.0001:a1*b2/a2;
c_2 = ( b1*c_1*a2 - a1*b1*b2 - b1*b2*a2 ) / (a1*b2);

figure(1)
plot(c_1,c_2,'LineWidth',4)
grid on
title('c2 given c1')

% Jacobian
A = [diff(f1,x), diff(f1,y);...
    diff(f2,x), diff(f2,y)];

% The trace of the jacobian
Tau = trace(A);
Tau = subs(Tau,[x,y],[x_crit,y_crit]);
[C1, C2] = meshgrid(0:.001:a1*b2/a2,0:.001:.09);
Tau = subs(Tau,[c1,c2],{C1,C2});

figure(2)
surf(C1,C2,double(Tau))
title('Tau')

% The determinate of the jacobian
D = det(A);
D = subs(D,[x,y],[x_crit,y_crit]);
D = subs(D,[c1,c2], {C1,C2});

% Phase Portrait
F = double(Tau) - 4*double(D);

figure(3) 
surf(C1,C2,F)
title('Phase Portrait')


% double(subs(x_crit,[c1,c2],[.07,.01]))
% double(subs(y_crit,[c1,c2],[.07,.01]))








