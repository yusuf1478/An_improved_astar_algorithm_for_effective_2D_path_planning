function [undirectedGraph,unedges]=generate_undirected_graph2(map,nodelocation,wfull)
% takes map and produce undirected map and its adge set

% take number of node
nnode=size(nodelocation,1);
% set graph and edges as zero
undirectedGraph=zeros(nnode,nnode);
unedges=[];

%generate undirected graph
for i=1:nnode-1 
    for j=i+1:nnode
        % take each pair of node^s location x, y and z
        wkontrol=0;
        for k=1:length(map.pgStart)
            for t=1:6
               Surface=CubeSurfaces(map.pgStart{k},map.pgBoyut{k},t);
               minX=min(Surface(:,1)); maxX=max(Surface(:,1));
               minY=min(Surface(:,2)); maxY=max(Surface(:,2));
               minZ=min(Surface(:,3)); maxZ=max(Surface(:,3));
               A=Surface(1,:);B=Surface(2,:);C=Surface(3,:);
               AB=B-A; AC=C-A;               
              [I,wcheck]=plane_line_intersect(cross(AB,AC),A,nodelocation(i,:),nodelocation(j,:));               
               if (wcheck==1)
                  if ((minX<=round(I(1),2)) && (round(I(1),2)<=maxX) && (minY<=round(I(2),2)) && (round(I(2),2)<=maxY) && (minZ<=round(I(3),2)) && (round(I(3),2)<=maxZ))
                    wkontrol=1;
                    break;
                  end; 
                end; 
            end;
            if (wkontrol==1)
              break;
            end;
        end;
        
        % if there is not any intersection
        if (wkontrol==0)
            % connect this two nodes in graph
            undirectedGraph(i,j)=1;
            undirectedGraph(j,i)=1;
            % add this connection to adge set
            unedges=[unedges;i j;j i];
        end
    end
end
