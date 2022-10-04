function [COPRASsolution,COPRASindex] = MCDM(paretofront,MCDMparam)

decisionmatrix = [paretofront(:,1) -1.*paretofront(:,2)];

sumcriteria = sum(decisionmatrix);
normalizedecisionmatrix = [decisionmatrix(:,1)/sumcriteria(1,1) , decisionmatrix(:,2)/sumcriteria(1,2)];

IPFweight = MCDMparam.IPF;
SEAweight = MCDMparam.SEA;
normIPFmat = normalizedecisionmatrix(:,1)*IPFweight;
normSEAmat = normalizedecisionmatrix(:,2)*SEAweight;

negativeS = normIPFmat;
positiveS = normSEAmat;

negativesum = sum(negativeS);
negativefracsum= sum((1./negativeS));

for i = 1:size(negativeS) 
  Q(i,1) = positiveS(i) + ((negativesum)/(negativeS(i)*negativefracsum));
end

[maxQ,indexQ] = max(Q);
scatter(paretofront(:,1),paretofront(:,2),'green'); hold on;
scatter(paretofront(indexQ,1),paretofront(indexQ,2),200,'rp','filled');

end
