% Salmon Population with Reproduction Function

clc
clear
close all

% S = 1000000;
% k = 29100000;

format long
S = 10;
k = 15;
time_max = 150;
c = .0001;
T_opt = 12.5;
r = 5;
d = .32;

a = .08;
b = 9.54;

T = [12.5, 22.2, 30];
pop = zeros([time_max/.1+1,3]);
for i = 1:3
    R = log( d*r / (1 + c*(T(i)-T_opt)^4) );

    dS =@(s) R*s*(1-s/k);

    salmon = @(t,s)(dS(s));

    t = 0:.1:time_max;

    [t,pops] = ode15s(salmon,t,S);
    pop(:,i) = pops;
end


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pop(:,1),'-','Color',[0.10,0.70,1.00],'LineWidth',4);
hold on
p2 = plot(t,pop(:,2),'--','Color',[0.8500 0.3250 0.0980],'LineWidth',4);
hold on
p3 = plot(t,pop(:,3),':','Color',[0.0000 0.80 0.130],'LineWidth',4);
hold on
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Salmon", 'FontSize', 25)
str = "The Population of Alaskan Salmon Over Time";
title(str,"Interpreter","Latex", 'FontSize', 35)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;

ax.GridAlpha = 1;
set(gca,"FontSize",20)

syms t

R =@(t) d*r / (1 + c*(a*t + b-T_opt)^4);

R_prime = diff(R(t),t);

f =@(t) log(R(t)) + R_prime*t/R(t);

dS =@(t,s) (log(8/(5*(((2*t)/25 - 74/25)^4/10000 + 1))) - (4*t*((2*t)/25 - 74/25)^3*(((2*t)/25 - 74/25)^4/16000 + 5/8))/(78125*(((2*t)/25 - 74/25)^4/10000 + 1)^2)).*s.*(1-s/k);

salmon = @(t,s) [dS(t,s)];

t = [0 time_max];

[t,pops] = ode45(salmon,t,S);



% Plotting the population over the time duration
figure(1)
p4 = plot(t,pops,'-.','Color',[0.83,0.00,1.00],'LineWidth',4);
legend('$12.5^{\circ}$C', '$22.2^{\circ}$C', '$30^{\circ}$C', 'R(t)',  'Interpreter', 'Latex', 'FontSize', 20, 'Location', 'NorthEast')
ax.GridAlpha = 1;
set(gca,"FontSize",20)



