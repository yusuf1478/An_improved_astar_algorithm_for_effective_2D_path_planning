
% This project builds upon the A* path planning implementation 
% from the FOMR-1 project (https://github.com/joedavidbuilds/FOMR-1). 
% Significant modifications and improvements were introduced by 
% Rustu Akay & Mustafa Yusuf Yildirim to improve path planning efficiency.
% akay@erciyes.edu.tr & yusufyildirim@ohu.edu.tr 
% Paper: https://doi.org/10.1016/j.matcom.2024.12.015

clc;
clear;
close all;


% number of nodes 
ns=50;
map=map_definition();


% generate random nodes
[map, nodelocation]=generate_node(map,ns);


% create undirected graph and its edges
[undirectedGraph,unedges]=generate_undirected_graph(map,nodelocation);


% define start and end point of simulation
% startp=[5, 29];
% endp=[29, 20];
startp=map.startp;
endp=map.endp;


% add start and end location as a new 2 nodes in undirected map.
% n+1 th node is start point, n+2th node is end point
[extungraph,exnodelocation,exunedges]=addstartendpoint2ungraph(map,undirectedGraph,nodelocation,unedges,startp,endp);
exundnodIndex=[1:ns+2];
snodeund=ns+1;
enodeund=ns+2;


% optimal path with improved astar on undirectional map
[Route]=astar(extungraph,exnodelocation,snodeund,enodeund);
if ~isempty(Route)
    astar_route=exnodelocation(Route,:);
    wbol=5;
    [ggnodelocation,ggedges,gggraph]=enhance_route(map, astar_route, wbol);
    ggundnodIndex=[1:size(ggnodelocation,1)];
    [Route2] = astar(gggraph,ggnodelocation,1,size(ggnodelocation,1));
    astar_route2=ggnodelocation(Route2,:);
    cost=pathcost(astar_route2);
    close all;
    drawRoute('Improved Astar',1,size(ggnodelocation,1),ggnodelocation,ggundnodIndex,ggedges,Route2,cost);
end
