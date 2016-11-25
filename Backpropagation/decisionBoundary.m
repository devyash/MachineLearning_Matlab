function decisionBoundary(W2,W3,xmin,xmax,dx,ymin,ymax,dy)
 
xlim([xmin xmax])
ylim([ymin ymax])
hold on;
for x=xmin:dx:xmax
	for y=ymin:dy:ymax
		activation = forwardPropagate([x y]',W2,W3 );
		if activation{end}(1) > 0.5
            scatter(x,y,'filled','red');
			%plot(x,y,'.r', "markersize", 20)
        else
            scatter(x,y,'filled','green');
			%plot(x,y,'.g', "markersize", 20)
		end
		hold on;
	end
end
 
end

