data = datatable144;

[w,x]=meshgrid(0:0.05:1,0:0.05:1);
[y,z]=meshgrid(0:0.05:1,0:0.05:1);
y = 0.*ones(21);
z = 0.*ones(21);

for row=1:21
    for column=1:21
        pred=[w(row,column);x(row,column);y(row,column);z(row,column)];
        Y1 = poslin144(pred);
        disp(pred);
        ipfpred1(row,column) = Y1(1,1);
        seapred1(row,column) = Y1(2,1);
    end
    end
ANNIPF1 = ipfpred1*(max(data(:,5))-min(data(:,5)))+min(data(:,5));
ANNSEA1 = seapred1*(2435.2-727.3)+727.3;

[j,k]=meshgrid(120:2:160,300:10:500);
[u,v]=meshgrid(300:10:500,2:0.15:5);

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

% responsesurf1 = ( ...
%     +d(1).*x1 ...  
%     +d(2).*x2 ...
%     +d(3).*x3 ...
%     +d(4).*x4 ...
%     +d(5).*x1.*x1 ...
%     +d(6).*x2.*x2 ...
%     +d(7).*x3.*x3 ...
%     +d(8).*x4.*x4 ...
%     +d(9).*x1.*x2 ...
%     +d(10).*x1.*x3 ...
%     +d(11).*x1.*x4 ...
%     +d(12).*x2.*x3 ...
%     +d(13).*x2.*x4 ...
%     +d(14).*x3.*x4 ...
%     +d(15).*x1.*x1.*x1 ...
%     +d(16).*x1.*x1.*x2 ...
%     +d(17).*x1.*x2.*x2 ...
%     +d(18).*x2.*x2.*x2 ...
%     +d(19) ...
%     );
% 
% responsesurf2 = ( ...
%     +e(1).*x1 ...  
%     +e(2).*x2 ...
%     +e(3).*x3 ...
%     +e(4).*x4 ...
%     +e(5).*x1.*x1 ...
%     +e(6).*x2.*x2 ...
%     +e(7).*x3.*x3 ...
%     +e(8).*x4.*x4 ...
%     +e(9).*x1.*x2 ...
%     +e(10).*x1.*x3 ...
%     +e(11).*x1.*x4 ...
%     +e(12).*x2.*x3 ...
%     +e(13).*x2.*x4 ...
%     +e(14).*x3.*x4 ...
%     +e(15).*x1.*x1.*x1 ...
%     +e(16).*x1.*x1.*x2 ...
%     +e(17).*x1.*x2.*x2 ...
%     +e(18).*x2.*x2.*x2 ...
%     +e(19) ...
%     );

[j,k]=meshgrid(1:0.1:3,100:3:160);
[u,v]=meshgrid(300:10:500,2:0.15:5);
mesh(j,k,ANNSEA1,'FaceAlpha',0.2,'EdgeColor','k','FaceColor','r','EdgeAlpha',1);
grid on;
box on;
ax = gca;
ax.GridLineStyle = ':';
ax.GridAlpha = 0.4;
ax.TickDir = 'in';
set(gca, 'FontName', 'Times New Roman','FontSize',14,'FontSmoothing', ...
    'on','LineWidth',1.5,'TickLength',[0.025 0.025])
xlabel('\itTR\rm ');
ylabel('\itA1\rm (mm)')
zlabel('SEA (J/kg)')
zlim([500 2500])
view(300,15)
hold on;

a1 = 1:9;
a2 = 10:18;
a3 = 19:27;
a4 = 28:36;

a1 = 37:45;
a2 = 46:54;
a3 = 55:63;
a4 = 64:72;

a1 = 73:81;
a2 = 82:90;
a3 = 91:99;
a4 = 100:108;

a1 = 109:117;
a2 = 118:126;
a3 = 127:135;
a4 = 136:144;

plot3(sort(:,1),sort(:,2),sort(:,6),'kp','MarkerSize',10,'MarkerFaceColor',"r");
hold on;
% plot3(data(a1,3),data(a1,4),data(a1,6),'kp','MarkerSize',10,'MarkerFaceColor',"r");
% hold on;

% plot3(data(a2,3),data(a2,4),data(a2,6),'kp','MarkerSize',10,'MarkerFaceColor',"g");
% hold on;

% plot3(data(a3,3),data(a3,4),data(a3,6),'kp','MarkerSize',10,'MarkerFaceColor',"b");
% hold on;