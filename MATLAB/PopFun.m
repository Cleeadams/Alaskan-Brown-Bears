  % Create a function that runs the different parameters
  
function[] = PopFun(N,GP,MR,r)



G = BearPop(N,GP(1),GP(2),GP(3),GP(4),GP(5),MR(1),MR(2),MR(3),MR(4),MR(5),r)


end

function[G] = BearPop(N,m,f,sm,sf,c,Male_M,Female_M,Sub_M,Sub_F,Cub_M,r)

  % Prediction over 10 years
G = r*(sf+f) - (sm*Sub_M + sf*Sub_F + m*Male_M + f*Female_M + c*Cub_M);
  % G -> growth rate
end