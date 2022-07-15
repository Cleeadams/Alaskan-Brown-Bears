% cookies
clear
clc

f = @(x,y,z) 13*x + 39*y + z;
count = 0;
for x = 0:6
    for y = 0:2
        for z = 0:78
                test = f(x,y,z);
            if test == 78
                count = count +1;
                break
            elseif test >= 78
                break
            else
            end
        end
    end
end
count