[w,x]=meshgrid(1:0.02:2,120:0.8:160);
[y,z]=meshgrid(300:4:500,2:0.06:5);
y=ones(51)*400;
z=ones(51)*3.5;

for row=1:51
    for column=1:51
        pred=[w(row,column) x(row,column) y(row,column) z(row,column)];
        Y1 = IPF81relu(pred);
        Y2 = IPFRSM(pred);
        ANN(row,column) = Y1;
        RSM(row,column) = Y2;
    end
end

[j,k]=meshgrid(1:0.02:2,120:0.8:160);
[u,v]=meshgrid(300:4:500,2:0.06:5);

mesh(j,k,RSM,'FaceAlpha',0.5,'EdgeColor','k','FaceColor','b','EdgeAlpha',0.5);
grid on;
box on;
ax = gca;
ax.GridLineStyle = ':';
ax.GridAlpha = 0.4;
ax.TickDir = 'in';
set(gca, 'FontName', 'Times New Roman','FontSize',14,'FontSmoothing', ...
    'on','LineWidth',1.5,'TickLength',[0.025 0.025])
xlabel('\itTR\rm');
ylabel('\itA\rm (mm)')
zlabel('IPF (kN)')
zlim([50 200])
view(60,30)
hold on;
mesh(j,k,ANN,'FaceAlpha',0.5,'EdgeColor','k','FaceColor','r','EdgeAlpha',0.5);
scatter3(data(5:9:77,1),data(5:9:77,2),data(5:9:77,5),'k','filled','LineWidth',2);
legend('RSM','ANN')
%mesh(j,k,RSM,'FaceAlpha',0.5,'EdgeColor','w','FaceColor','g','EdgeAlpha',0.1);

%% 

[j,k]=meshgrid(120:2:160,300:10:500);
[u,v]=meshgrid(300:10:500,2:0.15:5);

mesh(u,v,ANNIPF1,'FaceAlpha',0.2,'EdgeColor','k','FaceColor','g','EdgeAlpha',1);
grid on;
box on;
ax = gca;
ax.GridLineStyle = ':';
ax.GridAlpha = 0.4;
ax.TickDir = 'in';
set(gca, 'FontName', 'Times New Roman','FontSize',14,'FontSmoothing', ...
    'on','LineWidth',1.5,'TickLength',[0.025 0.025])
xlabel('\itL\rm (mm)');
ylabel('\itT\rm (mm)')
zlabel('IPF (kN)')
zlim([60 180])
view(60,15)
hold on;

a1 = 1:9;
a2 = 10:18;
a3 = 19:27;

a1 = 28:36;
a2 = 37:45;
a3 = 46:54;

a1 = 55:63;
a2 = 64:72;
a3 = 73:81;

% plot3(data(a1,3),data(a1,4),data(a1,5),'kp','MarkerSize',10,'MarkerFaceColor',"r");
% hold on;

plot3(data(a2,3),data(a2,4),data(a2,5),'kp','MarkerSize',10,'MarkerFaceColor',"g");
hold on;

% plot3(data(a3,3),data(a3,4),data(a3,5),'kp','MarkerSize',10,'MarkerFaceColor',"b");
% hold on;
