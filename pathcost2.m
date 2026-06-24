function cost=pathcost2(route)
% calculate route cost
cost=0;
for i=1:size(route,1)-1
    cost=cost+costcal2(route(i,:),route(i+1,:));
end

