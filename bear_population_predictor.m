 % Population model

close all
clear 
clc 

  % The population of Alaskan brown bears over time should equate to 30,000.
  
  % According to the Alaskan government the estimated population of brown 
  % bears is 30,000.
N = 30000;
  
  % Gender proportions - (Wieglus and Bunnell, 1994)
m = .3;
f = .22;
sm = .295;
sf = .185;
c = .15;

  % Harvest rates
    % The harvest rate seems to be included with the mortality rates already.
h = [0, .05, .067, .1];

  % Mortality rates
    % Cubs (0.5 - 1.5)
Cub_M = .22;
    % Subadults
Sub_M = .44;
Sub_F = .11;
    % Adult mortality rate (> 5)
Male_M = .15;
Female_M = .07;


  % Reproductive rate for young adult females.
r = .42;

  % Prediction over 10 years
time = 11;

    % Check to see if the article lines up with sf + f.
##for i = 2:time
##  N(i) = N(i-1) * ( 1 + r(2) * (sf+f) ) - N(i-1) * ( c * Cub_M(1)...
##     + sm * Sub_M(1) + sf * Sub_F(1) + m * Male_M(1) + f * Female_M(1) )
##end

for i = 2:time
  N(i) = N(i-1) * ( 1 + r * (sf+f) ) - N(i-1) * ( sm * Sub_M...
     + sf * Sub_F + m * Male_M + f * Female_M )
end

figure(1)
plot(0:time-1, N, "linewidth", 2)
xlabel("Time (yrs)", 'FontSize', 25)
ylabel("Population of Brown Bears", 'FontSize', 25)
title("The Population of Alaskan Brown Bears", 'FontSize', 25)
grid on

gr = N(time)/N(1)
1-gr

