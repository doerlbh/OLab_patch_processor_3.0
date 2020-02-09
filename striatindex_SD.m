% Dependent Function: patchindex
% To calculate the patch index in a 1-dimensional space as striate

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016
% update:   Dec 2017

function [si_curve, si_sd] = striatindex_SD(X)

Xsize = size(X);
flat = Xsize(2);

vec = X(:,2:end) - X(:,1:end-1);

veclength = sqrt(vec.^2 + ones(Xsize(1), Xsize(2)-1));
curve = sum(veclength, 2);

% striate index from curve method
si_curve = 1 - flat/mean(curve);

% striate index from sd method
si_sd = mean(std(X));

end


