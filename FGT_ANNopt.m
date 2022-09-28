close all;

        MultiObj.fun = @ReLu ;
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
[R,Rfit,Rrank] = NSGAII(params,MultiObj);   
row = sum(Rrank==1);
paretofront = Rfit(1:row,:);
optimalsolution = R(1:row,:);
scatter(paretofront(:,1),paretofront(:,2),'b*','LineWidth',3);

MCDMparam.SEA = 0.5;
MCDMparam.IPF = 0.5;

MCDM(paretofront,optimalsolution,MCDMparam);
xlim([63 72])
ylim([-2200 -1600])