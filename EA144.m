function [Y,Xf,Af] = EA144(x,~,~)
%EA144 neural network simulation function.
%
% Auto-generated by MATLAB, 02-Mar-2023 11:05:37.
% 
% [Y] = EA144(X,~,~) takes these arguments:
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
b1 = [3.3649109007259552229;-1.9856607845277627344;3.2001477370804134459;-1.737875624068775382;-4.154831761753829511;3.6900038214468877662;-0.25922835173412428489;0.94498077290102044934;2.9061897980869435543;0.13732798800702430975;0.052841821639153838119;-0.36922017082776331653;4.2523385087497240775;0.73723218385074407166;-7.833508598484195673;-4.8528947653139224983];
IW1_1 = [-1.7359956189206229293 0.44652734031198121345 -0.15018422838027395416 -3.2983728839168304781;-0.79736835722493903944 -4.8299734841976418309 -4.620915970490113267 1.7184119839034390775;1.7945912702307125208 1.2011601811592333977 -3.9282407240568253393 -4.6606528293368043592;1.9581120172824293402 1.1310184442000532634 -0.3067735112913858031 -1.833335020961987194;1.9533602515846681946 3.5731428792260793159 3.0474237181875634128 5.5698187292959771;-3.9304787576029300844 -1.8153843889861145389 0.85970106009085411891 -3.0414777064367646275;-1.0797227320132614103 4.5960807871044675466 -1.176477470438249906 4.2234692774333408849;-5.1586758788194133629 -3.0805114329006229035 4.2751775641974489872 -0.51082957416076801849;4.3731298413201864506 -3.8496846732598766216 -2.6450237726739769251 -2.5524930546853865643;1.4359249503805902037 -5.8163081540996417473 1.6594977206823915417 -1.4892661839711645033;-1.6336328082085103119 -0.34864548325850136523 -3.7923140599116482719 3.2469912031377967665;2.7208822475166516419 2.1663225138592139274 -2.9935754868021779984 0.7439828869372049347;2.1954047544750485699 2.3079975138068689056 -2.6170136815990212575 -5.8126663076581266409;-1.5653990744254508982 -1.4381858604441222216 1.4176422420310119676 -2.3178844437984746918;-1.4885824347164489101 2.5392251973240482776 2.6945619644527774028 1.4294314211438521323;-3.0574945944443516765 2.4531984515262719171 -1.1475884481308722407 6.1267043992403902308];

% Layer 2
b2 = -0.49420852001967013889;
LW2_1 = [0.29982871299108027063 -0.46220605799692232596 0.04328474453900175295 -0.31811778706767718239 0.055621012853166451606 -0.14104634707473143185 -0.14750167796511751139 -0.15612107956832890765 -0.028669597231398651765 -0.14779385289114457813 0.021138475873520305021 -0.29493188540126336061 -0.077126526714919776961 -0.2841571820235364032 -0.066958397905634209346 0.12832048618728242317];

% ===== SIMULATION ========
%%%%%%%%%%%%%%%%%%%%%%%%%% normalize input, not original code %%%%%%%%%%%%
x(:,1) = (x(:,1)-1)/(3-1);
x(:,2) = (x(:,2)-100)/(160-100);
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
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*X{1,ts});
    
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
Y(1,:)= ((Y(1,:))*(9970.66564-1071.31))+1071.31; %EA
Y= -1.*Y';
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end
