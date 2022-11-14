% Logistic growth as a function of x
clc
clear
close all


% Parameters
r = .01;
K = 10;
x = 0:.1:K+1;

% Logistic Function
y = r.*x.*(1-x./K);

% Plotting Function
plot(x,y,'LineWidth',4)
ax = gca;
ax.GridAlpha = 1;
set(gca,"FontSize",20)
set(gca,'XTickLabel',[],'YTickLabel',[])
grid on
grid minor
ax.MinorGridAlpha = 1;
xlim([0,11])
ylim([-.015,.03])
xlabel('\textbf{$x$}','Interpreter','latex','FontSize',25)
ylabel("\textbf{$x$}$'$",'Interpreter','latex',"FontSize",25)
title("\textbf{$x$}$'$ versus \textbf{$x$}",'Interpreter',...
    'latex',"FontSize",25)

