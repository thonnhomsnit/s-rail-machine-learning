function [Y,Xf,Af] = EA(x,~,~)
%EA neural network simulation function.
%
% Auto-generated by MATLAB, 28-Feb-2023 17:49:16.
% 
% [Y] = EA(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Layer 1
b1 = [0.88357352579771131218;-0.52807072499073381966;0.1318018848825637801;0.18796688283171730793;-0.2270629235812879898;0.90671708257825867072;-0.90806743393258981811;-0.773644946541007128];
IW1_1 = [-0.99065393893842723649 0.050989806023577992355 0.097924755804699392669 -0.090080979287165602321;0.24842608619293110594 0.276683131261502957 -0.39402512930998623286 1.2257269621845932051;0.72393515341599512514 -0.56317653403518830313 1.1516375098747961836 -0.30981411743062764463;-0.030471379214726763973 0.053373312455011000244 -0.2248141907188115074 -0.99252620237808952819;-0.040523362162704051892 -0.2657259540231510786 0.29361243073741993825 1.5735104941272521906;-0.34686084127022293044 -0.18004507932740199116 0.27573278115814781053 -1.138871586122704338;-0.71371662498617371995 -0.85368150560716937747 -0.96832270268783449119 0.75458901650330578725;-0.88732157283786849966 -0.47441223203043203505 -0.14222818423681737876 -0.78011406441498509778];

% Layer 2
b2 = 0.41106985493790426656;
LW2_1 = [0.59447667964801975682 0.43906669184886437662 0.24538552551498815646 -0.095820664684641426723 -0.29742689925617626923 -1.053931141300925356 -0.7193515462037405328 0.05310999299708085708];

% ===== SIMULATION ========
%%%%%%%%%%%%%%%%%%%%%%%%%% normalize input, not original code %%%%%%%%%%%%
x(:,1) = (x(:,1)-1)/(2-1);
x(:,2) = (x(:,2)-120)/(160-120);
x(:,3) = (x(:,3)-300)/(500-300);
x(:,4) = (x(:,4)-2)/(5-2);

X=x';
%%%%%%%%%%%%%%%%%%%%%%%%%% normalize input, not original code %%%%%%%%%%%%
% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    % no processing
    
    % Layer 1
    a1 = poslin_apply(repmat(b1,1,Q) + IW1_1*X{1,ts});
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = a2;
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
Y(1,:)= ((Y(1,:))*(9970.66564-1950.403851))+1950.403851; %EA
Y= -1.*Y';
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Linear Positive Transfer Function
function a = poslin_apply(n,~)
  a = max(0,n);
  a(isnan(n)) = nan;
end
