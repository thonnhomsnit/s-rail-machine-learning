function [Y,Xf,Af] = ipf_ea_mass(x,~,~)
%IPF_EA_MASS neural network simulation function.
%
% Auto-generated by MATLAB, 28-Feb-2023 17:19:24.
% 
% [Y] = ipf_ea_mass(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Layer 1
b1 = [0.021571144558904964406;0.05856548571034248668;-0.62317199951071189368;-0.70224750851616046798;0.47814380897910080392;-0.27363099414825531319;0.79671815382471289357;-0.18221330890005490999;-0.38381243485050786646];
IW1_1 = [0.66893334368882684249 -0.33505605734605070634 0.0013964043800167563053 -0.0060856020167783901609;-0.032243845512864119374 0.65454495990733785327 -0.029286570770630630106 -0.028865253472798675649;-0.45712026578454145742 -0.72202899575117451825 0.011337898725589878879 -0.86246969934274830827;0.1847208044138874683 0.1584489124942176641 -0.25814562540806534896 0.85809776242958879511;0.21206415609757608975 0.96514879123855423781 -0.012106894451819893987 0.94828441337625313245;-0.43160514882757960997 0.35836202507599207445 -0.65063702914932253218 0.52646863851263869805;-0.98293405919981824415 0.054681089497686213852 0.026196374176773441073 0.011721206946001256136;-0.066552593209911317662 -0.25172610744353024481 0.31078234685410832672 0.98257556895444009282;-0.56767843485837099493 -0.50838889211080529051 -0.1642346565168877337 -0.44493724283076141468];

% Layer 2
b2 = [-0.35482419365948669743;-0.83733692188791075672;-0.47605309920572613791];
LW2_1 = [0.50726728450665836689 0.56819218141360527952 -0.42391858864772746784 0.0053722762211718105146 0.0097249696445077648405 -0.010468698057614059596 1.0827530035287196153 -0.0022514713147477605215 0.50628440433946542143;-0.010501425520603735464 -1.8730564675401342178 -0.51360254313942199644 -1.0031941134438371321 1.3175137303039097247 0.41435205616951492624 0.41900009425636808302 -0.59581118129128518568 0.05408343875988652627;-0.0047937706659227285674 -0.79171744599951299204 0.4312996865962830384 0.19161489530662756398 0.70206930087710861521 0.18361940850499886002 0.34469026348457154629 -0.26176825237059009321 0.15316853867325930239];

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
Y(1,:)= ((Y(1,:))*(163.2074-65.22771))+65.22771; %IPF
Y(2,:)= ((Y(2,:))*(9970.66564-1950.403851))+1950.403851; %EA
Y(3,:)= ((Y(3,:))*(6.23578-1.81576))+1.81576; %Mass
Y= 1.*Y';
Y(:,2)=-1.*(Y(:,2)./Y(:,3));
Y = Y(:,1:2);
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Linear Positive Transfer Function
function a = poslin_apply(n,~)
  a = max(0,n);
  a(isnan(n)) = nan;
end
