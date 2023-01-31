edges = [-250:25:250];
%myerror = error(:,4)
% h = histogram(myerror,edges,'Normalization','probability');
% line([-50, -50], ylim, 'LineWidth', 2, 'Color', 'b');
% line([50, 50], ylim, 'LineWidth', 2, 'Color', 'b');
% ylim([0 20])
%hval=h.Values
%prob=hval(10)+hval(11)
histfit(myerror,10,'normal')
pd = fitdist(myerror,'Normal')
xlim([-10 10])
ylim([0 30])
% xticks([-1 1])
line([0, 0], ylim, 'LineWidth', 2, 'Color', 'k');
