function [ correctness] = Correctness(OUTPUT,Y,m )

coun=0;
for i=1:m
    if(OUTPUT(i,1)==Y(i,1))
        coun=coun+1;
    end
end
correctness=coun/m*100;
end

