
clc;
clear;
close all;


% number of nodes 
ns=50;
map=map_definition2();


% generate random nodes
[map, nodelocation]= generate_node2(map,ns);
 

% define start and end point of simulation
startp=[1, 1, 1];
endp=[29, 29, 29];


% add start and end location as a new 2 nodes
nodelocation(ns+1,:)=startp;
nodelocation(ns+2,:)=endp;
snodeund=ns+1;
enodeund=ns+2;
exundnodIndex=[1:ns+2];


%point start and end point
hold on;
plot3(nodelocation(ns+1,1),nodelocation(ns+1,2),nodelocation(ns+1,3),'r*');
plot3(nodelocation(ns+2,1),nodelocation(ns+2,2),nodelocation(ns+2,3),'r*')


% create undirected graph and its edges
[undirectedGraph,unedges]=generate_undirected_graph2(map,nodelocation,0);


% optimal path with improved astar on undirectional map
[Route] = astar(undirectedGraph,nodelocation,snodeund,enodeund);
if ~isempty(Route)
    route=nodelocation(Route,:);
    wbol=5;
    [ggnodelocation,ggedges,gggraph]=enhance_route2(map, route, wbol);
    ggundnodIndex=[1:size(ggnodelocation,1)];
    [Route2] = astar(gggraph,ggnodelocation,1,size(ggnodelocation,1));
    route2=ggnodelocation(Route2,:);
    cost=pathcost2(route2);
    close all;
    drawRoute2('Improved Astar',1,size(ggnodelocation,1),ggnodelocation,ggundnodIndex,ggedges,Route2,cost,1);
end
