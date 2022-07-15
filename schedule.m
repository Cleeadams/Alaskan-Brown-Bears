% Randomized schedule maker

clear
clc

    % This is our availabilty for each day.
M = [2:6];
T = [12,1,5:9];
W = M;
Th = T;
F = [5:8];
    % Comment out friday because we want our results by friday, but we
        % can include it if we want.
% F = [5:7];

    % Randomly picks 3 days.

% number of days we are picking.
n = 3;
% number of days we are picking from.
m = 4;
days = randperm(m,n);

for i = 1:length(days)
    if days(i) == 1
            % randomly picks start time.
        T_Begin = randsample(M,1);
        T_End = mod(T_Begin+1,12);
        floor = randi([2,6]);
            % Prints schedule in command window.
        fprintf("Monday: %d - %d\nFloor: %d\n",[T_Begin,T_End,floor])

    elseif days(i) == 2
        T_Begin = randsample(T,1);
        T_End = mod(T_Begin+1,12);
        floor = randi([2,6]);
            % Prints schedule in command window.
        fprintf("Tuesday: %d - %d\nFloor: %d\n",[T_Begin,T_End,floor])

    elseif days(i) == 3
        T_Begin = randsample(W,1);
        T_End = mod(T_Begin+1,12);
        floor = randi([2,6]);
            % Prints schedule in command window.
        fprintf("Wednesday: %d - %d\nFloor: %d\n",[T_Begin,T_End,floor])

    elseif days(i) == 4
        T_Begin = randsample(Th,1);
        T_End = mod(T_Begin+1,12);
        floor = randi([2,6]);
            % Prints schedule in command window.
        fprintf("Thursday: %d - %d\nFloor: %d\n",[T_Begin,T_End,floor])

    else
        T_Begin = randsample(F,1);
        T_End = mod(T_Begin+1,12);
        floor = randi([2,6]);
            % Prints schedule in command window.
        fprintf("Friday: %d - %d\nFloor: %d\n",[T_Begin,T_End,floor])

    end
end
