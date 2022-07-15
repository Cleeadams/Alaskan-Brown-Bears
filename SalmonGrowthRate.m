% Exponential Decay Model for Fish.

    % N_t = N_0 e^(-kt)

    % dN/dt = r*N_t
N = 5000;
r = .1;
K = 20000;

t = 0:25;

h = @(t,y)(r.*y(1));
[t, za] = ode45(h,t,N);
h2 = @(t,y)(r.*y(1).*(1-(y(1)/K)));
[t,ze] = ode45(h2,t,N);

figure(1)
plot(t,za(:,1),'b')
hold on
plot(t,ze(:,1),'r')
hold off
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population", 'FontSize', 25)
title("The Population of Salmon Over Time", 'FontSize', 25)
legend('Exponential','Logistic', 'FontSize', 15, 'Location', 'NorthWest')
grid on




