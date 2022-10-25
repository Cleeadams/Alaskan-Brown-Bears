% Trace and determinate

clear
clc
close all

R =@(T) log( .32*5 / ( 1 + .0001*(T - 12.5)^4 ) );

T = 12.5;
k1 = 15;
k2 = 6;

a1 = R(T);
b1 = a1 / k1;

a2 = .016123;
b2 = a2 / k2;

syms c1 c2 x y

f1 = a1*x - b1*x^2 - c1*x*y;
f2 = a2*y - b2*y^2 + c2*x*y;

A11 = diff(f1,x);
A12 = diff(f1,y);
A21 = diff(f2,x);
A22 = diff(f2,y);

A = [A11, A12;...
    A21, A22];

Tau = trace(A);
D = det(A);

F = Tau^2 - 4*D;

crit = [a1 - b1*x - c1*y; a2 - b2*y + c2*x];
[x_crit,y_crit] = solve(crit,[x,y]);

F = subs(F,[x,y],[x_crit,y_crit]);
Tau = subs(Tau,[x,y],[x_crit,y_crit]);

[C1, C2] = meshgrid(0:.01:.5,0:.01:.5);

F = subs(F, [c1,c2], {C1,C2});
Tau = subs(Tau,[c1,c2],{C1,C2});

figure(1)
surf(C1,C2,double(F))

figure(2)
surf(C1,C2,double(Tau))




