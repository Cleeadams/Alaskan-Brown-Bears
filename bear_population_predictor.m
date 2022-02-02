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
sm = .22;
sf = .11;
c = .15;

  % Harvest rates
    % The harvest rate seems to be included with the mortality rates already.
h = [0, .05, .067, .1];

  % Mortality rates
    % Cubs (0.5 - 1.5)
Cub_M = [.3, .4, .22];
    % Subadults
Sub_M = [.44, .21];
Sub_F = [.11, .7];
    % Adult mortality rate (> 5)
Male_M = [.19, .28, .3];
Female_M = [.13,.7];


  % Reproductive rate for young adult females.
r = [.7, .735, .76, .46];

  % Prediction over 10 years
time = 10;

    % Check to see if the article lines up with sf + f.
for i = 2:time
  N(i) = N(i-1) * ( 1 + r(2) * (sf+f) ) - N(i-1) * ( c * Cub_M(1)...
     + sm * Sub_M(1) + sf * Sub_F(1) + m * Male_M(1) + f * Female_M(1) )
end


plot(1:time, N)
grid on

N(10)/N(1)
