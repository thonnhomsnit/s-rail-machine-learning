
data = datatable81
[w,x]=meshgrid(0:0.05:1,0:0.05:1);
[y,z]=meshgrid(0:0.05:1,0:0.05:1);
w = 1.*ones(21);
x = 0.5.*ones(21);

for row=1:21
    for column=1:21
        pred=[w(row,column);x(row,column);y(row,column);z(row,column)];
        Y1 = tansig81(pred);
        disp(pred);
        ipfpred1(row,column) = Y1(1,1);
        seapred1(row,column) = Y1(2,1);
    end
    end
ANNIPF1 = ipfpred1*(max(data(:,5))-min(data(:,5)))+min(data(:,5));
ANNSEA1 = seapred1*(max(data(:,6))-min(data(:,6)))+min(data(:,6));

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
