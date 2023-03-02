function [Y,Xf,Af] = IPF(x,~,~)
%IPF neural network simulation function.
%
% Auto-generated by MATLAB, 28-Feb-2023 17:49:05.
% 
% [Y] = IPF(X,~,~) takes these arguments:
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
b1 = [-0.34842574596208492066;0.22292186140087386081;0.2446712064079848703;0.54195310767639326421;0.24069726262457377675;0.78043111182567848072;-0.36128086682226251414;0.82188914814451485835;0.63802930596705875743;-0.6614997824936286186];
IW1_1 = [0.65990485408101529075 -0.81205297765222472783 -0.52117710339239231576 0.088540649105416244224;0.25858311601893613219 0.87449016054827366506 0.41639450969366170741 -1.243645348893848368;-1.3032533179137555379 0.37790200636154275271 0.053329848876096840049 -0.0022978053372961575705;-0.5290636850909318234 0.67649100566255193634 -0.0042102803257595342035 0.32717060640387635173;-0.29352328526532478481 0.67491840145363868331 -0.15351091267865749068 -0.032740628597759106888;-0.059591946019834210468 0.54964015930606224813 -0.08686031629445256641 0.55651472501331245013;0.99928152242446532938 0.37244755700020804046 0.51915515010691237752 0.033083821344024794131;-1.4804056641448666287 0.60026027063188003297 -0.060648742393801274853 -0.023736537782142623498;0.0044294168400262458676 -0.44217008765730608788 0.09328338647051034882 0.8964549834477605339;-0.48153382256757426561 -0.63471174330654633877 -0.85329471212943830416 -0.42968054379580156166];

% Layer 2
b2 = 0.27698019134627677174;
LW2_1 = [-0.019733923397605841049 -0.0011438640292370737782 0.42515094882552439959 0.61993728597083341825 -0.13323444468766137971 -0.26533211843993698142 -0.059268854823046938918 0.12281247574734988071 -0.062888080245429023307 -0.15465719490406137915];

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
Y= 1.*Y';
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Linear Positive Transfer Function
function a = poslin_apply(n,~)
  a = max(0,n);
  a(isnan(n)) = nan;
end
