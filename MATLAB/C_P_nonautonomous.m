% Critical Points of a the non-autonmous system of ODEs

clc
clear
close all


% Parameters
R =@(t) .32*5 / ( 1 + .0001*(.08 * t + 9.54 - 12.5)^4 );
syms t
R_prime = diff(R(t));


k1 = 10;
k2 = 5;

a1 = log(R(t)) + R_prime*t/R(t);
b1 = a1 / k1;

% When does a1 become negative?
time_a1_0 = vpasolve(a1==0,70);

a2 = .016123; % Making the reproduction rate for brown bears positive.
b2 = a2 / k2;

c1 = .06;
c2 = .02;

% Critical Points

x_crit = (a1*b2 - c1*a2) / (c1*c2 + b1*b2);
% To keep x_crit within constraints: c1 < a1*b2/a2 = a1/k2
y_crit = (a1*c2 + b1*a2) / (c1*c2 + b1*b2);
% To keep y_crit within constraints: c2 > -b1*a2/a1 = -a2/k1

time = 0:.1:500;
x_c = subs(x_crit,t,time);
y_c = subs(y_crit,t,time);

plot3(x_c,y_c,time)
grid on






