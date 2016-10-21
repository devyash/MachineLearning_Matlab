function [N_C1] = Calculate_NJ(Species,N)
%Return N for Y=1(Species=1)
N_C1=0;
for n=1:N
if(Species(n) == 1)
    N_C1=N_C1+1;
end

end

