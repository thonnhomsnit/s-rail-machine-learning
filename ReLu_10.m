function [Y,Xf,Af] = ReLu_10(X,~,~)
%RELU_10 neural network simulation function.
%
% Auto-generated by MATLAB, 17-Apr-2023 14:01:25.
% 
% [Y] = ReLu_10(X,~,~) takes these arguments:
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
b1 = [0.42713003517226016958;0.81087079555644037132;0.99807566643804013218;-0.2932476306907061403;-0.52097109439902133943;0.36501485552272461277;0.070276829410589908287;-0.56184935204560626509;0.1966531593352951468;1.0641861777882695161];
IW1_1 = [-0.13159050848259126743 -0.081887854350104871681 0.34664241807482448765 0.52208920901992816876;-0.50545585736892650885 -0.58715915085150671704 0.70921079609987403014 -0.27072315140401287392;-0.30786180060809686942 -1.7874185624252505455 -0.68274854547522934034 0.63712893960884642297;-0.33175045016611759419 -0.79396105874157574256 0.86450927739190042143 0.016003477168294144573;-0.87561650218016762182 -0.70301485119462814311 0.014928917503156391433 -0.22608924213106473822;0.32883119197823729163 0.72458354880566333556 -0.85867430503523722862 -0.96141155391307675515;-0.3675308097179519895 -0.32209320394799673126 1.0034062176657516652 0.16414293992235307051;0.48694361143758713162 -0.031384944102521794562 -0.99106653374003039758 -0.30419262273996761081;0.37709751271526037453 0.76451664155817078417 -1.4401411746655576884 0.29404943018550744327;0.544492489085413367 0.69442020175623331291 0.12338598210883509887 0.46206681661659265714];

% Layer 2
b2 = -0.097324691150520156735;
LW2_1 = [-0.01357149164085819093 -0.12779997170830242892 -0.12803678354832576103 0.53918608500604570111 0.73940761044280534087 -0.72324030913720516178 -0.68800394539737641519 -0.45991913734968559169 0.19900606844875651236 0.51263607649299103297];

% ===== SIMULATION ========

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
end

% ===== MODULE FUNCTIONS ========

% Linear Positive Transfer Function
function a = poslin_apply(n,~)
  a = max(0,n);
  a(isnan(n)) = nan;
end
