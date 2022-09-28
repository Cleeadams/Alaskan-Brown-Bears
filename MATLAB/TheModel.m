% Analysis of the final model
    % Please note that 1990 will be our starting year.

    % Parameters
% Reproduction rates
r_B = .1;
r_S = .5;

% Carry capacity
K_B = 50000;
K_S = 40000000;

% Initial populations
B_o = 30000;
S_o = 1000000;

% Interaction terms
c_B = .1;
c_S = .1;

% Reproduction function parameters
c = 1/501;
T_opt = 12.5; % Celsius

% Temperature function parameters
r_T = .08;
b_T = 6.3;


    % Functions
% Temperature function
T=@(t) r_T * t + b_T;

% Reproduction function
R=@(t) r_S / ( 1 + c*(T(t) - T_opt)^4 );

% Bear ODE
dB =@(B,S) c_B*B*S - r_B*B*(1 - ( B/K_B ) );

% Salmon ODE
dS =@(B,S,t) R(T(t)) * ( 1 - ( S/K_S ) ) - c_S*B*S;

% Time duration starting at 1990.
t=0:.01:20;

% System of ODE function
MODEL = @(t,B,S)[dS(B,S,t); dB(B,S)];

% System of ODE solver
[t,pop] = ode45(MODEL,t,[S_o;B_o]);

% Plotting the population over the time duration
figure(1)
plot(t,pop)
grid on



