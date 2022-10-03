%Population of salmon

S = 1000000;
k = 29100000;

time_max = 80;
c = .0001;
T_opt = 12.5;
T = [12.5, 22.2, 30];
r = .32*log(5);

pop = zeros([time_max/.01+1,3]);

for i = 1:3
    R = r / (1 + c*(T(i)-T_opt)^4);

    dS =@(s) R*s*(1-s/k);

    salmon = @(t,s)(dS(s));

    t = 0:.01:time_max;

    [t,pops] = ode45(salmon,t,S);
    pop(:,i) = pops;
end


% Plotting the population over the time duration
figure(1)
p1 = plot(t,pop(:,1),'Color',[0.8500 0.3250 0.0980],'LineWidth',4);
hold on
p2 = plot(t,pop(:,2),'Color',[0.8500 0.3250 0.0980],'LineWidth',4);
hold on
p3 = plot(t,pop(:,3),'Color',[0.8500 0.3250 0.0980],'LineWidth',4);
hold off
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Salmon", 'FontSize', 25)
str = "The Population of Alaskan Salmon Over Time At $30^{\circ}$C";
title(str,"Interpreter","Latex", 'FontSize', 35)
legend('Salmon', 'FontSize', 25, 'Location', 'NorthWest')
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;
set(gca,"FontSize",20)

