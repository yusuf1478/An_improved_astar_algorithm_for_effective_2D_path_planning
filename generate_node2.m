function [map, nodelocation]= generate_node2(map,nnode)

% % merge vertices of all obstacle
% obsStart=map.pgStart{1};
% obsBoyut=map.pgBoyut{1};
% for i=2:length(map.pgStart)
%     obsStart=[obsStart NaN map.pgStart{i}];
%     obsBoyut=[obsBoyut NaN map.pgBoyut{i}];
% end
% map.obsStart=obsStart;
% map.obsBoyut=obsBoyut; 

% set nodelocation to all zero
nodelocation=zeros(nnode,3);
% generate nodes
n=1;
while (n<=nnode)
    % generate random two number in range of map's border
    rx=rand* (map.xrange(2)-map.xrange(1)) + map.xrange(1);
    ry=rand* (map.yrange(2)-map.yrange(1)) + map.yrange(1);
    rz=rand* (map.zrange(2)-map.zrange(1)) + map.zrange(1);
    state=0;
    for jj=1:length(map.pgStart)
      xyz=CubeCorners(map.pgStart{jj}, map.pgBoyut{jj});      
      tess = convhulln(xyz);
      testpoints = [rx ry rz];
      % if this node is not inside any obstacle
      if (inhull(testpoints,xyz,tess)==1)
         state=1;          
      end      
    end
    if (state==0)
      % add this location to nodelocation list
      nodelocation(n,1)=rx;
      nodelocation(n,2)=ry;
      nodelocation(n,3)=rz;
      n=n+1;
     end
end
% hold on;
% plot3(nodelocation(:,1),nodelocation(:,2),nodelocation(:,3),'b*');
% hold off;