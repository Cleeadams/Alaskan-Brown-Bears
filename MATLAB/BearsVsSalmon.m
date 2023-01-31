% Bears Vs. Salmon System of ODE


N_b = 30000;
N_s = 150000;

r_b = -0.016123;
r_s = .1;
K_b = 50000;
K_s = 200000;
beta = .000004;

t = 0:100;
% 
% b = @(t,y)[r_b.*y(1).*(1-(y(1)/K_b))];
% [t za] = ode45(b,t,[N_b]);
% s = @(t,y2)[r_s.*y2(1).*(1-(y2(1)/K_s))];
% [t,ze] = ode45(s,t,[N_s]);

PP = @(t,y)[r_b.*y(1).*(1-(y(1)/K_b)) + beta.*y(1).*y(2); r_s.*y(2)...
    .*(1-(y(2)/K_s)) - beta.*y(1).*y(2)];
[t,zo] = ode45(PP,t,[N_b,N_s]);

figure(1)
% plot(t,za(:,1),'b')
% hold on
% plot(t,ze(:,1),'r')
% hold on
plot(t,zo,'g')
hold off
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Brown Bears", 'FontSize', 25)
title("The Population of Alaskan Brown Bears Over Time", 'FontSize', 25)
legend('Bear','Salmon','Prey', 'FontSize', 25, 'Location', 'West')
grid on
