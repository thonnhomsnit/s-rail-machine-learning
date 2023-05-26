function [Y] = objfun144(x)
%SEA = EA(x)./mass(x)
Y = [IPF144(x) EA144(x) mass144(x)];
%Y = [IPF(x) EA(x)];
end
