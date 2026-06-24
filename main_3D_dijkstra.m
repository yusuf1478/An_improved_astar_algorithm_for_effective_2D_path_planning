
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


% optimal path with dijkstra on undirectional map
[Route Cost] = dijkstra(undirectedGraph,nodelocation,snodeund);
if ~isempty(Route)
    rt=Route{enodeund};
    route=nodelocation(rt,:);
    cost=pathcost2(route);
    close all;
    drawRoute2('Dijkstra',snodeund,enodeund,nodelocation,exundnodIndex,unedges,rt,cost,1);
end
