var1 = [0 0.5/2 1/2 1];
var2 = [1 1.5 2 3];
for varind = 1:4
[w,x]=meshgrid(0:0.2:1,0:0.2:1);
[y,z]=meshgrid(0:0.2:1,0:0.2:1);
w = var1(varind).*ones(6);
x = 0.*ones(6);
%y = 1.*ones(51);
%z = 1.*ones(51);
for row=1:6
    for column=1:6
        pred=[w(row,column);x(row,column);y(row,column);z(row,column)];
        Y1 = new144poslin(pred');
        ipfpred1(row,column) = Y1(1,1);
        %seapred1(row,column) = Y1(1,2);
        Y2 = new144tanh(pred');
        ipfpred2(row,column) = Y2(1,1);
        %seapred2(row,column) = Y2(1,2);
    end
    clearvars pred;
end
ANNIPF1 = ipfpred1;%%((ipfpred1)*(max(data(:,5))-min(data(:,5))))+min(data(:,5))
%ANNSEA1 = seapred1;%%((seapred1)*(max(data(:,6))-min(data(:,6))))+min(data(:,6))
ANNIPF2 = ipfpred2;%%((ipfpred1)*(max(data(:,5))-min(data(:,5))))+min(data(:,5))
%ANNSEA2 = seapred2;%%((seapred1)*(max(data(:,6))-min(data(:,6))))+min(data(:,6))

[j,k]=meshgrid(1:0.4:3,100:12:160);
[u,v]=meshgrid(300:40:500,2:0.6:5);
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

[j,k]=meshgrid(1:0.4:3,100:12:160);
[u,v]=meshgrid(300:40:500,2:0.6:5);

mesh(u,v,cubicresp1,'FaceAlpha',0.1,'EdgeColor','k','FaceColor','r','EdgeAlpha',1);
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
mesh(u,v,ANNIPF1,'FaceAlpha',0.1,'EdgeColor','b','FaceColor','#0072BD','EdgeAlpha',1); % blue
hold on;
mesh(u,v,ANNIPF2,'FaceAlpha',0.1,'EdgeColor','k','FaceColor',"k",'EdgeAlpha',1); % green
hold on;
% zlim([0 200])
% xlim([1 3])
% ylim([100 160])

plot3(u,v,cubicresp1,'r.','MarkerSize',10);
hold on;
plot3(u,v,ANNIPF1,'b.','MarkerSize',10);
hold on;
plot3(u,v,ANNIPF2,'k.','MarkerSize',10);
hold on;

clearvars j k u v w x y z;
end


plot3(p3(:,109:117),p4(:,109:117),t1(:,109:117),'kp','MarkerSize',10,'MarkerFaceColor',"y");
hold on;

plot3(p3(:,73:81),p4(:,73:81),t1(:,73:81),'kp','MarkerSize',10,'MarkerFaceColor',"y");
hold on;

plot3(p3(:,1:9),p4(:,1:9),t1(:,1:9),'kp','MarkerSize',10,'MarkerFaceColor',"y");
hold on;


legend('cubic RSM','ANN-ReLu','ANN-tanh');
legend('Position',[0.050065,0.85425,0.23062,0.1046])