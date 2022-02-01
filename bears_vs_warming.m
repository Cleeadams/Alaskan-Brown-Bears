% This is my first script for bears vs global warming

close all
clear
clc

    % Initial population size of brown bears
N = 30000;

    % Reporoductive rate estimated to be between .7 and .76
B = .7;

    % Cub survival rate is between .6 to .73
        % Death rate is between .27 and .4
        % Cub are between .5 to 1.5 years old
D1 = .4;
N_Cubs = .15*N;
        
    % mean value mortality rate for subadult and adult bears is .168
        % On average 60 percent female.
N_Adults = N - N_Cubs;
N_AF = .6*N_Adults;
D2_F = .168;
N_AM = N_Adults - N_AF;
D2_M = .23;


% Begin to model the growth of the Brown Bear population over time

for i = 1:10
N(i+1) = N(i) + B*N_AF(i) - D1*N_Cubs(i) - D2_F*N_AF(i) - D2_M*N_AM(i);
N_Cubs(i+1) = .25*N(i+1);
N_AF(i+1) = .6 * ( N(i+1) - N_Cubs(i+1) );
N_AM(i+1) = N(i+1) - N_Cubs(i+1) - N_AF(i+1);
end
        
plot(1:11,N)
grid on
        
        
        