clc
clear
close all

r = .01;
K = 10;
N = 0:.1:K+1;
y = r.*N.*(1-N./K);
plot(N,y,'LineWidth',4)
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

