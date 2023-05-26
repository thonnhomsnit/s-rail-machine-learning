load 81tanh.mat;
figure()
% filename = 'testnew51.gif';
h_rep = scatter3(fitipf(:,1),fitea(:,1),fitmass(:,1),'k');
for n = 1:1:100
      delete(h_rep);
      idx = T(:,n) > 3.5;
      w = fitipf(idx,n);
      x = fitea(idx,n);
      y = fitmass(idx,n);
      z = T(idx,n);
      front = table(w,x,y,z);
%       s = scatter3(front,'w','x','y','filled','ColorVariable','z','MarkerFaceAlpha',0.2);
%         colormap jet;
%         c = colorbar;
      s = scatter3(front,'w','x','y','filled','MarkerFaceAlpha',0.1);
      hold on;
     % h_rep = scatter3(fitipf(:,n),fitea(:,n),fitmass(:,n),'k');
      ylim([-10000 -1000])
      xlim([40 180])
      zlim([0 7])
      drawnow
%       frame = getframe(1);
%       im = frame2im(frame);
%       [imind,cm] = rgb2ind(im,256);
%       if n == 1
%           imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
%       else
%           imwrite(imind,cm,filename,'gif','WriteMode','append');
%       end
end
delete(h_rep);
scatter3(fitipf(1:row,101),fitea(1:row,101),fitmass(1:row,101),'filled','k')
%% 

delete(h_rep);
scatter3(fitipf(1:row,101),fitea(1:row,101),fitmass(1:row,101),'k')
clear all;