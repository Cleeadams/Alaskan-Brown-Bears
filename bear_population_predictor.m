% Population model

close all
clear 
clc 

  % The population of Alaskan brown bears over time should equate to 30,000.
  
  % According to the Alaskan government the estimated population of brown 
  % bears is 30,000.
N = 30000;
  
  % Gender proportions
m = .3;
f = .22;
sm = .22;
sf = .11;
c = .15;

  % Harvest rates
h = [0, .05, .067, .1];

  % Mortality rates
    % Cubs (0.5 - 1.5)
Cub_M = [.3, .4];
    % Subadults
Sub_M = .44;
Sub_F = .11;
    % Adult mortality rate (> 5)
Male_M = .19;
Female_M = .13;


  % Reproductive rate for young adult females.
r = [.7, .76];

  % Prediction over 10 years
time = 10;


for i = 2:time
  N(i) = N(i-1) * ( 1 + r(2) * (sf + f) ) - N(i-1) * ( h(1) + c * Cub_M(1)...
     + sm * Sub_M + sf * Sub_F + m * Male_M + f * Female_M )
end


    
plot(1:time, N)
grid on

N(10)/N(1)
