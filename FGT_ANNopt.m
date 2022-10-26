close all;

        MultiObj.fun = @tannet ;
        MultiObj.nVar = 4;
        MultiObj.var_min = [0 0 0 0];
        MultiObj.var_max = [1 1 1 1];
%end

% Parameters
params.Np = 100;        % Population size
params.pc = 0.9;        % Probability of crossover
params.pm = 0.5;        % Probability of mutation
params.maxgen = 100;     % Maximum number of generations
params.ms = 0.05;       % Mutation strength

% NSGA-II algorithm
[R,Rfit,Rrank,fitipf,fitsea,tr,A,L,T] = NSGAII(params,MultiObj);   
row = sum(Rrank==1);
paretofront = Rfit(1:row,:);
optimalsolution = R(1:row,:);
scatter(paretofront(:,1),paretofront(:,2),'b*','LineWidth',3);

paretofront(:,1) = paretofront(:,1).*(max(data(:,5))-min(data(:,5)))+min(data(:,5));
paretofront(:,2) = paretofront(:,2).*(max(data(:,6))-min(data(:,6)))+min(data(:,6));

% MCDMparam.SEA = 0.5;
% MCDMparam.IPF = 0.5;
% 
% MCDM(paretofront,MCDMparam);
% xlim([55 60])
% ylim([-2350 -2250])