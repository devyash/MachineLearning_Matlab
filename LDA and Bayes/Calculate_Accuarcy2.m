function [A_Percentage] = Calculate_Accuarcy2(OUTPUT_C,Species)
%returns the accuarcy
N=size(OUTPUT_C,1);
A=0;
for i=1:N
    if(OUTPUT_C(i,1)==Species(i,1))
        A=A+1;
    end
end
A_Percentage=A/N;
end

