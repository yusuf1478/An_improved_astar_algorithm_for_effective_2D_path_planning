function [ggnode,ggedges,gggraph]=enhance_route2(map, wroute, wbol)
% wbol=5;
% bbnode=[1 3; 4 -3; 3 2; 5 6; 4 -1];
% bbroute=[1 2 3 4 5];
bbnode=wroute;
bbroute=[1:size(wroute,1)];

% hold on;
ggnode=[];
gggraph=zeros(wbol*(size(bbnode,1)-1)+1,wbol*(size(bbnode,1)-1)+1);
for i=1:size(bbnode,1)-1
  ggnode=[ggnode; bbnode(bbroute(i),:)];
  x1=bbnode(bbroute(i),1);
  x2=bbnode(bbroute(i+1),1);   
  y1=bbnode(bbroute(i),2);
  y2=bbnode(bbroute(i+1),2); 
  z1=bbnode(bbroute(i),3);
  z2=bbnode(bbroute(i+1),3); 
%   plot3(x1,y1,z1,'rx','markersize',10);
%   line([x1;x2],[y1;y2],[z1;z2],'linewidth',0.1);
  xort=(x2-x1)/wbol;
  yort=(y2-y1)/wbol;
  zort=(z2-z1)/wbol;
  for j=1:wbol-1
    x3=x1+xort*j;
    y3=y1+yort*j;
    z3=z1+zort*j;
    ggnode=[ggnode; x3 y3 z3];
%     plot3(x3,y3,z3,'rx','markersize',10);
  end
end
ggnode=[ggnode; bbnode(bbroute(size(bbnode,1)),:)];

ggedges=[];
for i=1:size(ggnode,1)-1 
    for j=i+1:size(ggnode,1)
        wkontrol=0;
        for k=1:length(map.pgStart)
            for t=1:6
                % take each pair of node^s location x and y
                x1=[ggnode(i,1);ggnode(j,1)];
                y1=[ggnode(i,2);ggnode(j,2)];  
                z1=[ggnode(i,3);ggnode(j,3)];
                % check this two nodes intersect any obstacle or not
                %[xi,yi] = polyxpoly(x1,y1,map.obsx,map.obsy);
                Surface=CubeSurfaces(map.pgStart{k},map.pgBoyut{k},t);
                minX=min(Surface(:,1)); maxX=max(Surface(:,1));
                minY=min(Surface(:,2)); maxY=max(Surface(:,2));
                minZ=min(Surface(:,3)); maxZ=max(Surface(:,3));
                A=Surface(1,:);B=Surface(2,:);C=Surface(3,:);
                AB=B-A; AC=C-A;               
                [I,wcheck]=plane_line_intersect(cross(AB,AC),A,ggnode(i,:),ggnode(j,:));               
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
           gggraph(i,j)=1;
           gggraph(j,i)=1;
           % add this connection to adge set
           ggedges=[ggedges;i j;j i];
        end       
    end
end

%generate_undirected_graph
% ggedges=[];
% for i=1:size(wroute,1)-1
%  ggedges=[ggedges; wbol*(i-1)+1 wbol*i+1; wbol*i+1 wbol*(i-1)+1];
%  gggraph(wbol*(i-1)+1, wbol*i+1)=1;
%  gggraph(wbol*i+1, wbol*(i-1)+1)=1;
% %  for j=wbol*(i-1)+1:wbol*i+1
% %    gggraph(i, j)=1;
% %    %gggraph(j, i)=1;
% %  end;
% end
% for i=1:size(ggnode,1)-(wbol+1) 
%     wbas = ceil(i/wbol)*wbol+2;
%     for j=wbas:wbas+wbol-1
%       x1=ggnode(i,1);
%       x2=ggnode(j,1);   
%       y1=ggnode(i,2);
%       y2=ggnode(j,2); 
%       % check this two nodes intersect any obstacle or not
%       [xi,yi] = polyxpoly([x1 x2],[y1 y2],map.obsx,map.obsy);
%       if length(xi)==0
%         line([x1;x2],[y1;y2],'linewidth',0.1,'color','green');
%         gggraph(i,j)=1;
%         ggedges=[ggedges;i j];
%       end      
%     end
% end
