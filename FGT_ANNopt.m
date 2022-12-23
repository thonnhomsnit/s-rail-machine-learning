close all;

        MultiObj.fun = @tansig81;
        MultiObj.nVar = 4;
        MultiObj.var_min = [0 0 0 0];
        MultiObj.var_max = [1 1 1 1];

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
figure
scatter(paretofront(:,1),paretofront(:,2),'b*','LineWidth',3);
axis padded
% paretofront(:,1) = paretofront(:,1).*(169.8391-37.1100)+37.1100;
% paretofront(:,2) = paretofront(:,2).*(2435.1550-729.5885)+729.5885;

MCDMparam.SEA = 0.5;
MCDMparam.IPF = 0.5;

MCDM(paretofront,MCDMparam);
