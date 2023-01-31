%Population of salmon at different temperatures

% S = 1000000;
% k = 29100000;

clear
close all
clc

S = 20;
k = 29.1;

time_max = 30;
c = .0001;
T_opt = 12.5;
T = [12.5, 22.2, 30];
r = 5;

pop = zeros([time_max/.01+1,3]);

for i = 1:length(T)
    R = log( .32*r / (1 + c*(T(i)-T_opt)^4) );
    disp(R)

    dS =@(s) R*s*(1-s/k);

    salmon = @(t,s)(dS(s));

    t = 0:.01:time_max;

    [t,pops] = ode45(salmon,t,S);
    pop(:,i) = pops;
end


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pop(:,1),'Color',[0.10,0.70,1.00],'LineWidth',4);
hold on
p2 = plot(t,pop(:,2),'Color',[0.8500 0.3250 0.0980],...
    'LineWidth',4,'LineStyle','--');
hold on
p3 = plot(t,pop(:,3),'Color',[0.0000 0.80 0.130], ...
    'LineWidth',4,'LineStyle',':');
hold on
set(gca,"FontSize",20)
xlabel("Time (yrs)",'Interpreter', 'Latex', 'FontSize', 25)
ylabel("Population (millions)",'Interpreter', ...
    'Latex', 'FontSize', 25)
% str = "The Population of Alaskan Salmon Over Time";
% title(str,'Interpreter', 'Latex','FontSize', 25)
legend('$12.5^{\circ}$C', '$22.2^{\circ}$C', ...
    '$30^{\circ}$C',...
    'Interpreter', 'Latex', 'FontSize', 25, ...
    'Location', 'East')
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;

ax.GridAlpha = 1;




