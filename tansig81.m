function [Y,Xf,Af] = tansig81(x,~,~)
%TANSIG81 neural network simulation function.
%
% Auto-generated by MATLAB, 01-Nov-2022 15:02:36.
% 
% [Y] = tansig81(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Layer 1
b1 = [-6.5966288513786670578;-3.6840741947837485348;6.5914367298974854137;3.4287817895860981388;-4.4424807417197325066;3.3904825826664217736;-0.52628251786576851767;-4.6923034611168832342;3.9403318177640276332;-0.7808304411390247779;-0.89411879546149997111;0.85367052498274520467;2.2911195760184521752];
IW1_1 = [5.8253119962971942059 3.2326006379258842571 -5.7155797748385204216 -0.67945030232374881152;8.0241453555342960868 -2.554141549937472444 -2.8537545747006216601 0.029951236793058805263;0.45143615520902868887 -1.3598145157555570073 -5.9361802610537681701 -0.22059627332725384452;-0.54908929076089774135 -0.79863461815067471328 -0.37842563758607195012 -2.9650807873045876839;10.454091145791263529 -3.6244663356037642998 -4.0266289419735690203 0.036820625369387433024;-1.5008127871027268085 -0.99031827757458024131 1.5736998796785359733 -5.5008028310009287054;2.2112136762882830254 1.1492137396459467524 -1.5016179122010238078 -0.14833956514004403848;7.9296523159010385839 5.6661087941201930818 3.6780020155578139196 -0.18958141308529169455;0.81402689254606253044 0.94825399136533916611 -1.632477274508359999 -9.6806009513324937643;-3.3673273989580692067 -1.0678756750303919354 -1.8636727454620645172 3.0392864106957104831;-3.1491181460352448696 0.35438191960805465186 -5.2284148459082073757 0.10979484066492954664;1.8601180149787219786 1.101680090189350647 1.8120768901006820695 -2.3534398413821411289;7.3585153705759678289 -3.3502542012679903394 -1.1938733795422280526 -0.022632072892848287965];

% Layer 2
b2 = [0.52505415322782578169;0.22697008712999580671];
LW2_1 = [0.047854287075880228008 -2.0042910111304301779 -0.055493508215912736026 0.0031400203300054638049 1.7886602582550936713 -0.0013184040705806745683 0.15558285136306729268 -0.17148293454123289536 -0.0044828742719310700829 -0.036488239707824540736 -0.18217634077933320125 -0.049771350196210914496 -0.33918022164841693522;-0.056671933232524646096 -0.050643298430421555822 -0.094005877162371132005 0.49889864872661998652 0.090273026495026553739 -0.43656564842719314257 -0.058124612750888149382 0.051599708989391035452 -0.18668738434840706497 0.42473399243772791412 0.24617004154212862588 0.62132004272659513422 0.081043695372558385848];

% ===== SIMULATION ========
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
X=x';
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
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
Y(1,:)= ((Y(1,:))*(169.8391-65.2277))+65.2277; %IPF
Y(2,:)= ((Y(2,:))*(2217.028-729.5885))+729.5885; %SEA
Y=-1.*Y'; %%%% times -1 due to the minimizing ObjFn %%%%%
Y(:,1)=-1.*Y(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end