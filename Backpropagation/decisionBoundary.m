function decisionBoundary(W2,W3,xmin,xmax,dx,ymin,ymax,dy)
%funtion gives decision boundary plot
xlim([xmin xmax])
ylim([ymin ymax])
hold on;
for x=xmin:dx:xmax
	for y=ymin:dy:ymax
		activation = forwardPropagate([x y],W2,W3 );
		if activation > 0.5
            scatter(x,y,'filled','red');
        else
            scatter(x,y,'filled','green');
		end
		hold on;
	end
end
 
end

