var1 = (0:0.5:1);
var2 = (1:3);
for varind = 1:3
[w,x]=meshgrid(0:0.02:1,0:0.02:1);
[y,z]=meshgrid(0:0.02:1,0:0.02:1);
w = var1(varind).*ones(51);
x = 0.*ones(51);
%y = 1.*ones(51);
%z = 1.*ones(51);
for row=1:51
    for column=1:51
        pred=[w(row,column);x(row,column);y(row,column);z(row,column)];
        Y1 = ReLu(pred');
        ipfpred1(row,column) = Y1(1,1);
        %seapred1(row,column) = Y1(1,2);
        Y2 = tansig144(pred');
        ipfpred2(row,column) = Y2(1,1);
        %seapred2(row,column) = Y2(1,2);
    end
    clearvars pred;
end
ANNIPF1 = ipfpred1;%%((ipfpred1)*(max(data(:,5))-min(data(:,5))))+min(data(:,5))
%ANNSEA1 = seapred1;%%((seapred1)*(max(data(:,6))-min(data(:,6))))+min(data(:,6))
ANNIPF2 = ipfpred2;%%((ipfpred1)*(max(data(:,5))-min(data(:,5))))+min(data(:,5))
%ANNSEA2 = seapred2;%%((seapred1)*(max(data(:,6))-min(data(:,6))))+min(data(:,6))

[j,k]=meshgrid(1:0.04:3,100:1.2:160);
[u,v]=meshgrid(300:4:500,2:0.06:5);
x1 = var2(varind)%data(:,1);
x2 = 100%data(:,2);
x3 = u%data(:,3);
x4 = v%data(:,4);

cubicresp1 = ( ...
    +d(1).*x1 ...  
    +d(2).*x2 ...
    +d(3).*x3 ...
    +d(4).*x4 ...
    +d(5).*x1.*x1 ...
    +d(6).*x2.*x2 ...
    +d(7).*x3.*x3 ...
    +d(8).*x4.*x4 ...
    +d(9).*x1.*x2 ...
    +d(10).*x1.*x3 ...
    +d(11).*x1.*x4 ...
    +d(12).*x2.*x3 ...
    +d(13).*x2.*x4 ...
    +d(14).*x3.*x4 ...
    +d(15).*x1.*x1.*x1 ...
    +d(16).*x1.*x1.*x2 ...
    +d(17).*x1.*x2.*x2 ...
    +d(18).*x2.*x2.*x2 ...
    +d(19));

clearvars j k u v;

[j,k]=meshgrid(1:0.04:3,100:1.2:160);
[u,v]=meshgrid(300:4:500,2:0.06:5);

%mesh(u,v,cubicresp1,'FaceAlpha',0.5,'EdgeColor','#FFFFFF','FaceColor','r');
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
view(60,45)
hold on;
mesh(u,v,ANNIPF1,'FaceAlpha',0.5,'EdgeColor','#FFFFFF','FaceColor','#0072BD');
hold on;
mesh(u,v,ANNIPF2,'FaceAlpha',0.5,'EdgeColor','#FFFFFF','FaceColor',"#77AC30");
hold on;
% zlim([0 200])
% xlim([1 3])
% ylim([100 160])
clearvars j k u v w x y z ANNIPF1 ANNIPF2;
end
plot3(p3(:,109:117),p4(:,109:117),t1(:,109:117),'k.','MarkerSize',15);
hold on;

plot3(p3(:,73:81),p4(:,73:81),t1(:,73:81),'k.','MarkerSize',15);
hold on;

plot3(p3(:,1:9),p4(:,1:9),t1(:,1:9),'k.','MarkerSize',15);
hold on;
legend('cubic RSM','ANN-ReLu','ANN-tanh');
legend('Position',[0.050065,0.85425,0.23062,0.1046])