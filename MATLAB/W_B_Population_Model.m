  % Wielgus and Bunnell population model
  
close all
clear
clc

  % According to the Alaskan government the estimated population of brown 
    % bears is 30,000.
N = 30000;

  % Estimated reproductive rate .46 cubs/ adult female/ year
r = .46;

  % Different age groups of brown bears
m = .3;
f = .22;
sm = .22;
sf = .11;
c = .15;
  
  % Survival rates amongst different age groups
ms = .7;
fs = .93;
sms = .89;
sfs = 1;
cs = .78;

  % Prediction over 10 years
time = 100;

    % Check to see if the article lines up with sf + f.
for i = 2:time
  N(i) = N(i-1) * (r*f  + ms*m + fs*f + sms*sm + sfs*sf + c*cs)
end


plot(1:time, N)
grid on

N(10)/N(1)

