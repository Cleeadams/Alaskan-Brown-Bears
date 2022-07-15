  % Predator Prey Model
  
close all
clear
clc

x = 4000;
y = 2000;
a = .005;
b = 5e-6;
c = .005;
p = 1;
N = 5000;
for i = 1:N
  x(i+1) = x(i) + a*x(i) - b*x(i)*y(i);
  y(i+1) = y(i) -c*y(i) + p*b*x(i)*y(i);
end

figure(1)
plot(1:N+1,x)
hold on
plot(1:N+1,y)
grid on