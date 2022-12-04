data = datatable81

[j,k]=meshgrid(0:0.05:1,1:0.05:1);
x1 = 0.*ones(21)           %TR
x2 = 0.*ones(21)            %A
x3 = u      %T
x4 = v      %L

responsesurf1 = ( ...
    +b(1).*x1 ...  
    +b(2).*x2 ...
    +b(3).*x3 ...
    +b(4).*x4 ...
    +b(5).*x1.*x1 ...
    +b(6).*x2.*x2 ...
    +b(7).*x3.*x3 ...
    +b(8).*x4.*x4 ...
    +b(9).*x1.*x2 ...
    +b(10).*x1.*x3 ...
    +b(11).*x1.*x4 ...
    +b(12).*x2.*x3 ...
    +b(13).*x2.*x4 ...
    +b(14).*x3.*x4 ...
    +b(15) ...
    );

responsesurf2 = ( ...
    +c(1).*x1 ...  
    +c(2).*x2 ...
    +c(3).*x3 ...
    +c(4).*x4 ...
    +c(5).*x1.*x1 ...
    +c(6).*x2.*x2 ...
    +c(7).*x3.*x3 ...
    +c(8).*x4.*x4 ...
    +c(9).*x1.*x2 ...
    +c(10).*x1.*x3 ...
    +c(11).*x1.*x4 ...
    +c(12).*x2.*x3 ...
    +c(13).*x2.*x4 ...
    +c(14).*x3.*x4 ...
    +c(15) ...
    );

[u,v]=meshgrid(300:10:500,2:0.15:5);
mesh(u,v,responsesurf2,'FaceAlpha',0.2,'EdgeColor','k','FaceColor','b','EdgeAlpha',1);
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
zlabel('SEA (J/kg)')
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

% plot3(data(a1,3),data(a1,4),data(a1,6),'kp','MarkerSize',10,'MarkerFaceColor',"r");
% hold on;

% plot3(data(a2,3),data(a2,4),data(a2,6),'kp','MarkerSize',10,'MarkerFaceColor',"g");
% hold on;

plot3(data(a3,3),data(a3,4),data(a3,6),'kp','MarkerSize',10,'MarkerFaceColor',"b");
hold on;