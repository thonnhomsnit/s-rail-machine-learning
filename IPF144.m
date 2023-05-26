function [Y,Xf,Af] = IPF144(x,~,~)
%IPF144 neural network simulation function.
%
% Auto-generated by MATLAB, 02-Mar-2023 11:05:52.
% 
% [Y] = IPF144(X,~,~) takes these arguments:
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
b1 = [1.852744634010462299;1.2655315393097767984;-0.14651508855142172938;0.98331962399869421443;-5.998734119151527544;-0.40660912642756474877;8.3265512846676319469;1.7366560878801569068;-0.79432731251166610598;-1.2822360170282502967];
IW1_1 = [-3.2828587022014796837 -2.4140508524102721744 8.8995374780037046492 0.10569057731045221338;0.033803068193083846138 -1.8968604794308812078 -3.8678608724103535899 0.069998411461864959437;-1.4908685389446207914 0.72902479181647739104 2.570969292430972164 3.2470515298198434628;-2.3373794092607522721 0.80773782126049376018 0.29047082546773161926 0.014247713420825128608;0.062797531050262769825 4.4361090963945599697 2.0401685581330912811 3.3444553064994133607;-0.63849952462750370064 -0.44095856256942234097 1.407597899515491191 -0.017037884776673027643;3.4530670926796425135 -4.1172461343362494191 -7.506870193709959338 0.30139906864097470995;-0.97738345826916739334 -1.3788863050305895097 -2.7159247621297732955 0.061323502723804761139;-3.0711990143181591151 0.67301348583905251655 0.12459034703633249663 0.0039889037017174300628;0.64693473820930069706 1.2844897297387962709 2.2311773462264912204 -0.053411544281495915154];

% Layer 2
b2 = 0.75877340492162981267;
LW2_1 = [0.030874794548315150772 0.073968083851866026079 -0.00025559803637885240585 0.1765992999382769435 -0.0019088765716768030072 -0.10297003588617921477 -0.018449862888094439167 0.42532882523984177903 0.64552985744953816916 0.57577275010320372317];

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
Y(1,:)= ((Y(1,:))*(163.2074-37.11))+37.11; %IPF
Y= 1.*Y';
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end
