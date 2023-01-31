% Fish bell shape curve

close all
clear
clc

    % initial fish at 0 degrees celsius.
F_0 = 20;
% F_0 = 3.5824;
    % Optimal Water temp in celsius.
opt = 15.9;
    % Parameters to skew graph.
a = 2;
b = 1;

    % This should be the equation for population vs. salmon.
% for T = 0:30
% G =@(T) F_0 / ( ((T-opt)/a)^(2*b) + 1);
%     % copy and paste the below into desmos to see what I F(T) should look like.
% %         \frac{20}{1+\left(\frac{\left(x-15.9\right)}{4.5}\right)^{2}}
% 
% %     My hand calc for dF/dT
% K =80;
% dF =@(F) .005*G(T)*(1-F/K);
% 
% % % syms T
% % % %     MATLAB Calc. for dF/dT
% % % dF_Alt = gradient(F(T));
% % % disp(dF_Alt);
% % % 
% % % dF_Alt =@(T) -F_0*(T/2 - 159/20)/((T/2 - 159/20)^2 + 1)^2;
% % % disp(dF_Alt(T))
% t = 0:.01:100;
% % ODE Solver
% model =@(T,F)dF(F);
% [t pop] = ode45(model,t,F_0);
% 
%     % Plot for Salmon Versus Temperature in Celsius.
% figure(1)
% plot(t,pop);
% hold on
% end
% xlabel('Temperature (C)')
% ylabel('Population of Salmon')
% title('Effects of Salmon Populations As Temperature Changes')
% grid on
% hold off



% -------------- Change in Tmep with repect to time
% T_0 = 2;
% t = 0:.1:120;
% dT =@(T) .007*T;
% 
% model2 =@(t,T)dT(T);
% [t temp] = ode45(model2,t,T_0);
% 
% figure(2)
% plot(t,temp)
% xlabel('Time (Yrs)')
% ylabel('Temperature (C)')
% title('Change in Temperature over Time')
% hold off


% -------- Modeling Both Change in Salmon and Temperature ---------

T_0 = 6.2;
F_0 = 20;
K = 1000;
t = 0:1000;
r_s = .1;
r_t = 0.012687;
% T = y(2);
dT =@(y) r_t;

G =@(y) F_0 / ( ((y - opt)/a)^(2*b) + 1);
dF =@(y) r_s*(F_0 / ( ((y(2)-opt)/a)^(2*b) + 1))*(1-y(1)/K);

model3 =@(t,y)[dF(y); dT(y)];
[t, pop] = ode45(model3,t,[F_0, T_0]);

plot(t,pop)
xlabel('Time, (Yrs)')
ylabel('Population of Salmon, (blue line)')
title('Change of Salmon Population Over Time')






