% Making change for $0.25

clear
clc

d = .1;
n = .05;
q = .25;
desired = .7;

f=@(x,y,z) q*x + d*y + n*z;
i=0;

for x = 0:2
    for y = 0:7
        for z = 0:14
            i = i+1;
            change(i) = round(f(x,y,z),3);
            if change(i) > desired
                break
            else
            end
        end
    end
end

count = sum(change(:) == desired)



