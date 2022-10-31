function [Y,Xf,Af] = poslin144(x,~,~)
%POSLIN144 neural network simulation function.
%
% Auto-generated by MATLAB, 31-Oct-2022 16:46:46.
% 
% [Y] = poslin144(X,~,~) takes these arguments:
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
b1 = [0.19490129488991950191;0.84409675380364657116;-0.87961447704838457984;0.84847884021391140053;0.039266247850796770491;0.36308516714575234108;-0.84039357202366071764;-0.053052278674726949248;0.78696841198230749193;0.61605626641159116907;-0.16503658684159686065;-0.55015045971892762022;-0.83399400280739710567;0.85789650281333051929;-0.026874581470009734074;-0.81195586922882789782;0.35525631947069752359;-0.0077583563080912010951;-0.75611271833430526712;-0.32446145657477781787;0.30984129295110290903;-0.032314225092532879169;-0.83148096655955017198;0.30979309567601781561;0.52969846847544421742;0.62493443016308047877;-0.072061318057301759765;-0.66504603388200189684;1.0105289762319682456;-0.34804735353865140501;0.1124119934646001101;-0.39030605794221157057;0.31212910799668824868;-0.36197614233927555283;-0.39489808493992006877;0.1940130743433907401;-0.92341682361951149538;-0.30536491733345100252;0.14864257313237341784;-0.27464011363889268003;-0.48734503935538642239;-0.21735832688638148658;-0.18505012842220325275;0.37994805975736145598;0.96724634893791072709;-0.40308606684809894505;0.046356036283841148271;0.75784570982021470797;0.97871270182724900977];
IW1_1 = [-0.66149151034300235352 0.21312889001723414606 -0.56353492318823161789 -0.50775605733665163388;0.71966254952682251478 0.73633347137042748365 -1.0728857996149505638 -0.30824405662066967082;0.19966012778679712025 0.77318662483975730826 -0.50341616567537461613 0.9839936090849490391;-0.050079000168602304244 -0.82009473426594048373 0.57867742455355619668 0.83966691111822933102;0.8370565138178063247 0.60662875655019043997 0.16987931695168120849 0.79869686452288601863;-0.028189379572845479904 -0.17961481609924004332 0.18567245906579876724 -0.3423834180319448306;0.90726108388831250284 0.16140782410833576233 -0.57149156972145176425 -0.19033261046526717131;-0.64407218398935217607 -0.40548916905153875589 -0.15337749665117450526 -0.076483152288639777439;-1.092552096118904581 -0.58089875169254645559 -0.023405033206075637892 0.034893003483644990936;0.21245602955954084878 0.53660295188171158731 -0.91540142847479910593 -0.002579198676128565456;1.1317666630161371533 -0.3639091180163040451 0.72882449267459470388 0.028228643579345059217;-0.57046505682066184217 -0.62589309046973107264 1.0620694758336211017 -0.19726960177921076811;0.70652186112272929996 0.26103350823064525033 -0.12237815274565849721 0.21750599862953179375;-0.35734683257248789356 -0.36490169490367990734 0.11227994739809164793 0.74218785232277484365;0.30892331296965125365 0.42549319574250449305 -0.71887443058678246466 0.015898209470795222203;0.05478911274929531422 -0.37897789123502262365 0.25820712103631476841 1.1380618271688245358;0.086637844314059922479 0.55763128012870799566 0.84127233460953432242 -0.236351638576810269;-0.64137910151063959319 1.0799669604466513029 0.28585250854920601915 -0.55903519313533200918;-0.17333109037188368373 -0.47550865739186587433 -0.65744768687532617601 0.78884385739948892358;0.1769887836034698958 -0.033420329194786366211 0.35525716352528524666 0.30926381553930731849;-0.46008834239843982017 -0.6652260309790348769 0.30214866001795631645 0.0233311673389020105;0.057577769018671912105 -0.57929101399122129301 0.45486284598473358809 -0.21141871367644035629;-0.76557975891227769694 -0.43218198986314759757 0.21106339588803835206 0.1832264544668980033;0.36774708057141580753 0.32903347304879915214 -0.039351477882321621304 -1.2864182974339073429;0.070759931339612280876 -0.57564139037540729138 0.17545798534483053599 0.17476136573346440217;1.0337160219096153124 -1.213752267405499019 0.69138730673379733549 -0.037470377851016443971;-0.1346825598236442989 -0.49240036883840487825 -0.19636603608137215282 -0.30871207832350133771;0.18743009029621826578 -0.0049199129703325628071 0.38361000905890496604 -0.47693034767481545799;-0.37991409565454131725 0.89358754051357469628 1.1012482416658133655 -0.6663580481316683235;-0.71621527924832562029 -0.34650413962410353541 0.24129948373671425421 0.98497398724043616625;0.10016973170005184779 -0.39466317408571088832 0.2278196644965533868 -0.88327255145073646503;-0.28149042261724360747 -0.31422866083351363997 -0.098436591299342443562 0.57226112921286642621;0.2962503851138387212 0.12556481040849798436 -0.85567799720164638977 0.063947634189373478431;-0.079433263942421117321 0.15901370951202142834 -0.24213359222052788233 0.033408738001087456837;1.2328451641099720248 -0.59260449168834106182 0.30430783224265106623 -0.015184417041936350626;0.59616179057733120761 -0.029368458635798361939 0.15123118573114999186 -0.65313152778125194153;-0.26956255320153998944 0.58208865269142706644 0.17707191599734084519 -0.94878615926820986104;0.33032430755599861971 0.85587075470470530547 0.73715434446586658446 -0.061337563295985553236;-0.5835685461590858214 -1.1975687355471722473 0.76713781824459659209 -0.067766259765466199672;-0.64091680472539791502 -0.17571002221497086793 0.45836718237699958234 1.2896472274455861307;-0.72096945349357122179 0.96808796978528222077 0.19876550050964822414 0.03933310492105122208;0.024556548754053109107 0.1094828008918645873 0.057851870336390665006 -0.69317095818048546363;-0.82131811893890627196 -0.95679041849870083425 -0.24585863304569310905 -0.17672935062692007868;0.44963391199958668842 -0.48687040398122960472 -1.0533739186764876639 0.4708160097567600233;-0.88303458374376742057 0.31305498358157302086 0.78211393922346827967 0.57267801276864549465;0.77080210579409913496 0.6626881626388019253 -1.22841038304988448 0.066421113151086272341;1.1314724290980244792 -0.97523280798549438764 0.091165292867852382175 0.021788170424727769381;0.31402706092293541928 0.13969978102078695059 -0.34013807557431530171 0.21077713768056449695;-0.15346471945000195181 0.72869180382245379857 0.49561319956600635717 -0.4982092550850749646];

% Layer 2
b2 = [0.52539507281717867659;0.72010366750687337944];
LW2_1 = [0.47880479089881022858 -0.21635537990333139624 -0.041761243745890998247 -0.52746439382084786551 1.0409179683169733632 0.36222038958507379869 0.44188255831932504725 0.33065841456875588733 0.71922852537594650357 -0.61210287605853785919 -1.289645423678483338 -0.36831662427487726896 0.43527477819883303445 0.12399722628323486817 0.39569062917945668767 0.30954304793043585509 -0.12567166458285849995 -0.1186909890877400342 -0.88499025908087369796 -0.30212090282652404039 -1.2211246860832964956 0.43325576427802658941 -0.69075773420463493224 -0.19156677274958666679 -0.7845461824483986879 1.0309821274540380553 0.061429814453128672724 0.82789001547721152718 0.49712128015134082748 0.18623868272287408265 -0.36253543610822847043 -0.26340185662330917182 0.44344386341759017833 0.60849347301090661588 1.0921873015849035138 -0.16347961759786136526 -0.18323425318237629433 -0.83038757409671482002 0.60656087027543847956 0.069698971660923425553 0.76901652928503505535 -0.38247598945311672702 -0.080439578467295547171 0.24004934714349351887 -0.35787606910684227612 -0.61987743852556798085 -1.1865934756917628778 -0.3316755244460555252 0.26454169318242859443;-0.26740751608337931522 0.075625037777212328338 -0.24895265944844036099 0.47835555206761787295 -0.16412512354387573388 -0.4544131536212679956 0.66485885989577675481 -0.18069800876899932973 -0.13862511875230951186 -0.12832980588550321754 0.36286913664060499451 0.36192479813112038434 -1.0310329693419983954 -0.39653766404139956236 -0.32412405535076854735 0.22117797285258822271 0.7198353455459711725 0.15804257095817000889 0.2889516780662710338 -0.4284659075685516294 0.5817501627344987547 0.15934322478552218061 -0.041983951525047524811 -1.1437232136031076912 -0.85295182040330852491 -0.034221389453543485382 0.91691897903932839675 -0.83369443514678764906 -0.12786948488980470762 1.0808413215186476464 -0.44210005299445642724 -0.41996751595592374251 0.6122216776502432678 -0.06278119519523839287 0.13034873320487966319 0.46278833679061792683 -0.20404926182235105792 -0.38133934932474577995 -0.47269733885675008223 -0.57801012062089740517 0.2826943806600380471 0.28537015149110050993 0.25355623419225525872 -0.32450682851765305648 0.091846245041710586343 0.046580923153033450268 -0.30327432126692216441 0.61334451510882370684 -0.48845601502747915124];

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
Y(1,:)= ((Y(1,:))*(168.8391-65.2277))+65.2277; %IPF
Y(2,:)= ((Y(2,:))*(2217-729.5885))+729.5885; %SEA
Y=-1.*Y'; %%%% times -1 due to the minimizing ObjFn %%%%%
Y(:,1)=-1.*Y(:,1);
%%%%%%%%%%%%%%%%%%%%%%%%%% transpose output, not original code %%%%%%%%%%%%
end

% ===== MODULE FUNCTIONS ========

% Linear Positive Transfer Function
function a = poslin_apply(n,~)
  a = max(0,n);
  a(isnan(n)) = nan;
end
