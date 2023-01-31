% Reproduction rate with respect to temperature

clear
close all

T = -20:.1:45;
r = 5;
c = .0001;
T_opt = 12.5;

R = .32*log( r ./ (1 + c*(T-T_opt).^4) );

figure(1)
plot(T,R,'LineWidth',4)
xlabel("Temperature (Celsius)", 'FontSize', 25)
ylabel("Reproduction Rate", 'FontSize', 25)
title('Reproduction Rate Vs Temperature', "FontSize",20)
ax = gca;
grid on
grid minor
ax.MinorGridAlpha = 1;
ax.GridAlpha = 1;
set(gca,"FontSize",20)