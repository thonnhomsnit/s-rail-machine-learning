function [COPRASsolution,COPRASindex] = MCDM(paretofront,optimalsolution,MCDMparam)

%parameter
SEAweight = MCDMparam.SEA;
IPFweight = MCDMparam.IPF;

%COPRAS algo
decisionmatrix = -1.*paretofront(:,2);
sumcriteria = sum(decisionmatrix);
normalizedecisionmatrix = [decisionmatrix(:,1)/sumcriteria(1,1) , decisionmatrix(:,2)/sumcriteria(1,2) ];

%weightcheck = SEAweight*(sum(normalizedecisionmatrix(:,1))) + CFEweight*(sum(normalizedecisionmatrix(:,2)));

splus = SEAweight*normalizedecisionmatrix(:,1) + IPFweight*normalizedecisionmatrix(:,2);    
%positive attribution e.g. EA, SEA, CFE

%sminus = ?weight*normalizedecisionmatrix(:,?) + ?weight*normalizedecisionmatrix(:,?);      
%negative attribution e.g. PCF,mass

for i = 1:size(splus) 
 %    sminusmin = min(sminus); %constant
 %   sminussum = sum(sminus); %constant
 %  sminusfrac= sminusmin.*sum((1/sminus); %constant
  Q(i,1) = splus(i,1); %+ ((sminusmin*sminussum)/(sminus(i)*sminusfrac));
end

for i = 1:size(Q)
    U(i,1) = Q(i,1)/max(Q);
end

%select 1st rank (U=1)
COPRASindex = find(U == 1);
COPRASsolution = optimalsolution(COPRASindex,:);
COPRASfit = paretofront(COPRASindex,:);

scatter(paretofront(:,1),paretofront(:,2),'green'); hold on;
scatter(COPRASfit(:,1),COPRASfit(:,2),200,'rp','filled'); 
hold off;
axis tight;

figure();
scatter(paretofront(:,1),paretofront(:,2),'green'); hold on;
%scatter(COPRASfit(:,1),COPRASfit(:,2),200,'rp','filled'); 
hold off;
end
