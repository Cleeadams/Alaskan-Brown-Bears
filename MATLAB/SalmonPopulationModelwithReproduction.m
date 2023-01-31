% Salmon Logistic Equation with Growth Function

clc
clear
close all
format long

    % Growth Rate Function as a Function of Temperature

% Paramters
x_0 = 20;
k = 29.1;
time_max = 150;
r = 5;
d = .32;
c = 1e-4;
T_opt = 12.5;
t = 0:.1:time_max;

% Vector of Different Temperatures
T = [12.5, 22.2, 30];

% Empty Matrix to Store Solutions
pop = zeros([time_max/.1+1,3]);

% For loop for testing different temperatures
for i = 1:3
    % Growth Rate Function of Temperature
    R = log( d*r / (1 + c*(T(i)-T_opt)^4) );
    
    % Salmon Logistic Model
    dx =@(x) R*x*(1-x/k);

    salmon = @(t,x)(dx(x));
    
    % Solutions to the Function
    [t,pops] = ode15s(salmon,t,x_0);

    % Stores the Solutions in the empty matrix
    pop(:,i) = pops;
end


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pop(:,1),'-','Color',[0.10,0.70,1.00], ...
    'LineWidth',4);
hold on
p2 = plot(t,pop(:,2),'--','Color',[0.8500 0.3250 0.0980], ...
    'LineWidth',4);
hold on
p3 = plot(t,pop(:,3),':','Color',[0.0000 0.80 0.130], ...
    'LineWidth',4);
hold on
set(gca,"FontSize",20)
xlabel("Time (yrs)",'Interpreter', 'Latex', 'FontSize', 25)
ylabel("Population (million)",'Interpreter', 'Latex', 'FontSize', 25)
% str = "The Population of Alaskan Salmon Over Time";
% title(str,"Interpreter","Latex", 'FontSize', 25)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;



    % Growth Rate Function as a Function of Time

% New Parameters
a = .08;
b = 9.54;

% Allows for symbolic function to be created
syms t

% Symbolic Proportion Function with Respect to Time
R = d*r / (1 + c*(a*t + b-T_opt)^4);

% Derivative of the Proportion Function with Respect to Time
R_prime = diff(R);

% Growth Rate Function Dependent on Time
f = log(R) + R_prime*t/R;

% Non-autonomous ODE for Salmon
dx =@(t,x) (log(8/(5*(((2*t)/25 - 74/25)^4/10000 + 1))) - ...
    (4*t*((2*t)/25 - 74/25)^3*(((2*t)/25 - 74/25)^4/16000 + ...
    5/8)) / (78125*(((2*t)/25 - 74/25)^4/10000 + 1)^2)) .*...
    x .* (1-x/k);

salmon = @(t,x) [dx(t,x)];

% Creates Time Interval for Model
t = [0 time_max];

% Solutions to the Non-autonomous model
[t,pops] = ode45(salmon,t,x_0);


% Plotting the solutions on the figure 1
figure(1)
p4 = plot(t,pops,'-.','Color',[0.83,0.00,1.00],'LineWidth',4);
legend('$12.5^{\circ}$C', '$22.2^{\circ}$C', '$30^{\circ}$C', ...
    'G(t)', 'Interpreter', 'Latex', 'FontSize', 20, ...
    'Location', 'East')
ax.GridAlpha = 1;
set(gca,"FontSize",20)



