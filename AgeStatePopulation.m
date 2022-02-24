 % Population modeling considering H-model
 
close all
clear
clc

  % Initial population
N = 30000;


  % Age state vector
    % Cubs 0 - 2
    % Subadults 3 - 5
    % Adults 5 - 38
    
MaxAge = 38;
    
States = zeros(1,MaxAge);

  % Initial Population Proportions
  States(1) = .3;
m = States(1:MaxAge-5);
  States(1) = .22;
f = States(1:MaxAge-5);
  States(1:2) = .07;
  States(3) = .08;
sm = States(1:3);
  States(1:2) = .04;
  States(3) = .03;
sf = States(1:3);
c = [.07, .08];
  
  % Survival Proportions
ms = .7;
fs = .93;
sms = .89;
sfs = 1;
cs = .78;

  % reproductive rate
r = .46;

  % Model time frame
Time = 10;

for i = 2:Time
  cubs = [r*f, c(1)*cs]*N(i-1);
  submale = [c(2)*cs*.6, sm(1)*sms, sm(2)*sms]*N(i-1);
  subfemale = [c(2)*cs*.4, sf(1)*sfs, sf(2)*sms]*N(i-1);
  male = sm(3)*sms*N(i-1);
  female = sf(3)*sfs*N(i-1);
  for j = 2:MaxAge-5
    male(j) = m(j-1)*ms*N(i-1);
    female(j) = f(j-1)*ms*N(i-1);
  end

  csum = sum(cubs);
  smsum = sum(submale);
  sfsum = sum(subfemale);
  msum = sum(male);
  fsum = sum(female);
  
  N(i) = csum+smsum+sfsum+msum+fsum;
  
  c = cubs/N(i-1);
  sm = submale/N(i-1);
  sf = subfemale/N(i-1);
  m = male/N(i-1);
  f = female/N(i-1);
end
  
plot(1:Time, N)
grid on
  
  
  
  
  