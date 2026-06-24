function map=map_definition2()

%%% map 1
Npoly=4;
map.pgStart{1}=[3 0 0];
map.pgBoyut{1}=[3 30 20];
map.pgStart{2}=[10 0 10];
map.pgBoyut{2}=[3 30 20];
map.pgStart{3}=[17 0 00];
map.pgBoyut{3}=[3 30 20];
map.pgStart{4}=[24 0 10];
map.pgBoyut{4}=[3 30 20];
map.startp=[1, 1, 1];
map.endp=[29, 29, 29];

%%% map 2
% map.pgStart{1}=[20 20 0];
% map.pgBoyut{1}=[5 10 30];
% map.pgStart{2}=[20 0 0];
% map.pgBoyut{2}=[10 15 30];
% map.pgStart{3}=[5 0 0];
% map.pgBoyut{3}=[10 25 30];
% Npoly=size(map.pgStart,2);
% map.startp=[1, 1, 1];
% map.endp=[29, 29, 29];

map.xrange=[0 30];
map.yrange=[0 30];
map.zrange=[0 30];

figure;
set(gcf,'color','w');
xlim([0 30]);
ylim([0 30]);
zlim([0 30]);
box on;
grid on;
xlabel 'x'; ylabel 'y'; zlabel 'z';
hold on

for ii=1:Npoly    
    plotcube(map.pgBoyut{ii},map.pgStart{ii},.6,[0.5 0.5 0.5])
end

% view(0,90)
view([-15 30])

plot3(map.startp(1),map.startp(2),map.startp(3),'ks','LineWidth',2,'MarkerSize',6,'MarkerFaceColor','k');
plot3(map.endp(1),map.endp(2),map.endp(3),'kx','LineWidth',2,'MarkerSize',8,'MarkerFaceColor','k');

hold off

% close all;
