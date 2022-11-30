var1 = [0 0.5 1];
var2 = [0 0.5 1];
color = ['r' 'g' 'b'];
for varind = 1:3
[w,x]=meshgrid(0:0.1:1,0:0.1:1);
[y,z]=meshgrid(0:0.1:1,0:0.1:1);
w = 1.*ones(11);
x = var1(varind).*ones(11);
% y = 1.*ones(10);
% z = var1(varind).*ones(11);
for row=1:11
    for column=1:11
        pred=[w(row,column);x(row,column);y(row,column);z(row,column)];
        Y1 = poslin81(pred);
        disp(pred);
        ipfpred1(row,column) = Y1(1,1);
        seapred1(row,column) = Y1(2,1);
    end
    end
ANNIPF1 = ipfpred1*(max(data(:,5))-min(data(:,5)))+min(data(:,5));
ANNSEA1 = seapred1*(max(data(:,6))-min(data(:,6)))+min(data(:,6));

% [j,k]=meshgrid(0:0.1:1,0:0.1:1);
% [u,v]=meshgrid(0:0.1:1,0:0.1:1);
% x1 = 1              %TR
% x2 = k              %A
% x3 = u   %T
% x4 = var2(varind)%data(:,4);   %L

% responsesurf1 = ( ...
%     +b(1).*x1 ...  
%     +b(2).*x2 ...
%     +b(3).*x3 ...
%     +b(4).*x4 ...
%     +b(5).*x1.*x1 ...
%     +b(6).*x2.*x2 ...
%     +b(7).*x3.*x3 ...
%     +b(8).*x4.*x4 ...
%     +b(9).*x1.*x2 ...
%     +b(10).*x1.*x3 ...
%     +b(11).*x1.*x4 ...
%     +b(12).*x2.*x3 ...
%     +b(13).*x2.*x4 ...
%     +b(14).*x3.*x4 ...
%     +b(15) ...
%     );
% 
% responsesurf2 = ( ...
%     +c(1).*x1 ...  
%     +c(2).*x2 ...
%     +c(3).*x3 ...
%     +c(4).*x4 ...
%     +c(5).*x1.*x1 ...
%     +c(6).*x2.*x2 ...
%     +c(7).*x3.*x3 ...
%     +c(8).*x4.*x4 ...
%     +c(9).*x1.*x2 ...
%     +c(10).*x1.*x3 ...
%     +c(11).*x1.*x4 ...
%     +c(12).*x2.*x3 ...
%     +c(13).*x2.*x4 ...
%     +c(14).*x3.*x4 ...
%     +c(15) ...
%     );

clearvars j k u v;

[j,k]=meshgrid(120:4:160,300:20:500);
[u,v]=meshgrid(300:20:500,2:0.3:5);

mesh(u,v,ANNIPF1,'FaceAlpha',0.2,'EdgeColor','k','FaceColor',color(varind),'EdgeAlpha',1);
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
zlim([60 90])
view(60,15)
hold on;
% mesh(u,v,ANNIPF1,'FaceAlpha',0.1,'EdgeColor','b','FaceColor','#0072BD','EdgeAlpha',1); % blue
% hold on;
% mesh(u,v,ANNIPF2,'FaceAlpha',0.1,'EdgeColor','k','FaceColor',"k",'EdgeAlpha',1); % green
% hold on;
% zlim([0 200])
% xlim([1 3])
% ylim([100 160])

% plot3(u,v,responsesurf2,'r.','MarkerSize',1);
% hold on;
% plot3(u,v,ANNIPF1,'b.','MarkerSize',1);
% hold on;
% plot3(u,v,ANNIPF2,'k.','MarkerSize',1);
% hold on;

% clearvars j k u v w x y z;
end

% a1 = 1:9;
% a2 = 10:18;
% a3 = 19:27;

% a1 = 28:36;
% a2 = 37:49;
% a3 = 46:54;

a1 = 55:63;
a2 = 64:72;
a3 = 73:81;

plot3(data(a1,3),data(a1,4),data(a1,5),'kp','MarkerSize',10,'MarkerFaceColor',"r");
hold on;

plot3(data(a2,3),data(a2,4),data(a2,5),'kp','MarkerSize',10,'MarkerFaceColor',"g");
hold on;

plot3(data(a3,3),data(a3,4),data(a3,5),'kp','MarkerSize',10,'MarkerFaceColor',"b");
hold on;
% plot3(p3(:,73:81),p4(:,73:81),t1(:,73:81),'kp','MarkerSize',10,'MarkerFaceColor',"y");
% hold on;
% 
% plot3(p3(:,1:9),p4(:,1:9),t1(:,1:9),'kp','MarkerSize',10,'MarkerFaceColor',"y");
% hold on;


%legend('A1 = 120 mm','A1 = 120 mm','A1 = 120 mm');
% legend('Position',[0.050065,0.85425,0.23062,0.1046])