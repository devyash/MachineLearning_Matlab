load fisheriris
X = meas;
k=3;
z=randi(112);
V=X(z:z+k-1,:)
[idx,C,sumd,D] = kmeans(X,k,'start',V,'display','iter');
OUTPUT=[546.419,139.947,116.773,92.9041,86.0265,84.3879,83.5161,82.282,81.2778,80.2263,79.5923,79.0262,78.8557];
%[idx,C,sumd,D] = kmeans(X,k,'start',zeros(3,4),'display','iter');
%OUTPUT=[652.601 ,419.037 ,238.144 ,127.067 ,93.5001 ,81.9427 ,79.5415 ,78.8514 ];
plot(OUTPUT);
ylabel('Objective function magnitude J(U,V)')
xlabel('Iterations')