  % Fox vs. Rabbit
  
  clear
  close all
  clc
  
  

N = 30000;

% r by Van Daele
r_VD = -0.040450;
% r by Wieglus
r_W = -0.020700;
% r by McLellan (Table 2)
r_FV = 3.0300e-03;
% r by the average
r_AVG = -0.016123;
% r by McLellan
r_M = -0.047100;

r = r_FV;

K = 50000;

t = 0:10;

  % h = @(t,x)[r.*x(1)]
  % [t ya] = ode45(h,t,[N]);

  % figure(1)
  % plot(t,ya(:,1),'b');
  % hold on
  % grid on

h = @(t,y)[r.*y(1).*(1-(y(1)/K))];
[t za] = ode45(h,t,[N]);

figure(1)
plot(t,za(:,1),'b')
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Brown Bears", 'FontSize', 25)
title("The Population of Alaskan Brown Bears Over Time", 'FontSize', 25)
legend('Logistic', 'FontSize', 25)
grid on


