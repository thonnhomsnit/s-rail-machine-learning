function [Y] = objfun2(x)
%SEA = EA(x)./mass(x)
Y = [IPF(x) EA(x) mass(x)];
%Y = [IPF(x) EA(x)];
end
