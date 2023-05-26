function [Y,Xf,Af] = ReLu17(X,~,~)
%RELU17 neural network simulation function.
%
% Auto-generated by MATLAB, 17-Apr-2023 11:03:57.
% 
% [Y] = ReLu17(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 8xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Layer 1
b1 = [-0.31500565273231012631;0.51150793085193646537;-0.88025062890427119289;-0.2781887710067802999;-0.14466947948224376241;0.43601368076527446949;0.005813804846178641586;1.0303501879894301219;-0.81228959832333735847;-0.88359525677157435553;0.78328331414238339114;0.90670072940838386533;1.681034715094280374;0.16189424142906044812;0.34921619051752939011;-0.34039876694461562723;0.54548787224118511219];
IW1_1 = [-1.6146321859580938796 -0.20667891799513898876 0.32466733777878398204 0.54522379968734580036 0.0092854890059847240702 0.12446950988574445596 0.055787291388164794714 0.59720814825846213481;1.0642495187135678769 0.56192841794077863504 -1.3800143153275066243 1.0022031231711634458 0.093489992713206696018 -0.79800640354167562407 0.41629380201263016525 -0.71979843823131528513;0.073541360297941116286 -0.49814723217317397053 0.53575065470833482806 -0.38276930168232353724 0.21098644314859760218 0.76769579525775555329 -0.4889475708052100078 -0.94068377222833321483;-0.79233045349321828965 -0.9306109633793235858 0.03739796697116248847 0.23704531284806823477 -0.98767484956199402824 0.12999660607252350175 -0.77828059795563087064 0.048683724231170844021;-0.41685463765097346966 0.56510356850800724793 0.51220041345589140125 -0.96530409251961113437 -0.22896052678981249073 0.16018348871372548037 -0.34299684491142357068 -0.066290929364807613111;0.72166726177311191215 -0.12122747232612032797 -0.68110069956744534458 -1.0862604541661406987 -0.49317223844227547902 -0.28883957039139351863 -0.90444619924432245739 0.71037708500877561058;-0.37221828924714195352 -0.21461204042133361081 -0.33222906541578617334 -1.3834005868485907964 -0.65251460867024324575 0.19231886333642037035 -0.53010855131202117008 0.90862428316368903936;0.51932910343585270141 -0.32253752437007165987 0.15625257750196641648 -0.39334367511062645617 -0.055304801407818501846 -0.41354654532810580791 0.2527325134330503098 -0.27898099988929203619;-0.53614555732354318707 0.92055792052395624125 -0.24269194714990427464 -0.15504962791176746251 -0.12695045350426292785 -0.34988586040772706731 -0.23726387659281344966 -0.79535212591709947283;0.44267416162436590277 -0.93530032709345678477 -0.97714286456494492406 0.55805842247134762601 0.35600166318365156215 0.59873574840431187383 -0.43801318936283695216 -0.55338307355790616882;-0.78701567523455018272 -0.3591131369264093931 0.75695000068936102444 0.3328444540539070573 0.260361821226483936 0.60564040597404888988 0.14629616820931495846 0.33442373618750947939;-1.0331804469652621226 -0.030362353835476738051 -0.13516297541124541737 -0.77431426948544945787 -0.53420409589193840194 0.13902675873500067172 0.80805256544417825015 -0.59626612666176492805;0.3687952474270182468 -0.7537079102967509936 0.017927769955431667459 -1.4736557142086388339 -1.0154795315585787296 0.061497599212832175508 0.41621410316209334068 0.19177228569834003924;-0.3187674883674340709 -0.013305410060506041303 0.41761929532642255714 -0.14316093390270032137 -0.72072141195901029409 -1.0186537878743211483 0.024125352355042657682 -0.64081353451903788621;0.91645575486854624625 -1.1965149067489606605 -0.9291758781671635159 0.62775862025229056673 -0.30339873415351986674 -0.73285181119551268125 -0.21434769693345018249 0.35835075254437676051;-0.91887379361149135182 0.36503042981475947171 -0.47664493373518174169 -0.38032789804992428451 -0.89536757211701245573 0.4798533419454391602 -0.29231403582879367242 -0.44373962520586268665;1.1328390412747986193 -0.74956009438852366777 0.721456516579867424 0.27099762359096069009 -0.38496710801606770502 -0.24596442586878655701 -0.097183893680359220713 0.93754757868327065484];

% Layer 2
b2 = 0.47187987916778517672;
LW2_1 = [-1.1685882644178020584 0.85770522791295977783 0.50975573504122950741 0.43424793563581237654 -0.068762514787496814561 0.68593728229825057241 -0.7300832647307325951 -0.46786657038852319523 0.57146252259720986544 -0.82468079133011507054 -0.033697494820518064662 0.58263970421713817682 -0.51379541776794868113 0.27968969872442434044 -1.0034466149568082027 0.023275520199581109515 0.45734333277231692394];

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