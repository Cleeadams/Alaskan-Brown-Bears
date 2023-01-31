 % Population model

close all
clear 
clc 

    % Exponential growth rate -> y = N(1+G)^t
    % Growth rate is -> dN/dt = r*N
    % N(t) = N_0 e^(rt)
    % dN/dt = rN(1-N/k)
    % population growth rate




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
  
  
  % Gender proportions - (Wieglus and Bunnell, 1994) altered for Van Daele
GP_VD = [.3, .22, .295, .185, 0];
  % Mortality rate - (Von Daele, 2010)
MR_VD = [.15,.07,.44,.11,0];
  % Reproductive rate - (Von Daele, 2010) 
r_VD = .42;

  % Gender proportions - (Wieglus and Bunnell, 1994)
GP_W = [.3, .22, .22, .11, .15];
  % Mortality rate - (Wieglus and Bunnell, 1994)
MR_W = [.3,.07,.11,.09,.22];
  % Reproductive rate - (Wieglus and Bunnell, 1994)
r_W = .46;

  % Gender proportions - (McLellan, 1989) - using Wieglus and Bunnell
GP_FV = GP_W;
  % Mortality rate - (McLellan, 1989) - Table 2
MR_FV = [.18,.18,.06,.06,.15];
  % Reproductive rate - (McLellan, 1989) - Table 2
r_FV = .421;

  % Gender proportions - (McLellan, 1989) - using Wieglus and Bunnell
GP_M = GP_W;
  % Mortality rate - (McLellan, 1989)
MR_M = [.24,.24,.31,.31,.67];
  % Reproductive rate - (McLellan, 1989)
r_M = .85;


      % Collect the average for mortality and reproductive rates.
      GP_AVG = GP_W;
      MR_AVG = (MR_VD + MR_W + MR_FV) / 3
      r_AVG = (r_VD + r_W + r_FV) / 3


GP = GP_AVG;
MR = MR_AVG;
r = r_AVG;

PopFun(N,GP,MR,r)
