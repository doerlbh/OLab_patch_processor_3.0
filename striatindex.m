% Dependent Function: patchindex
% To calculate the patch index in a 1-dimensional space as striate

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016

function si = striatindex(X)

Xsize = size(X);
flat = Xsize(2);

vec = X(:,2:end) - X(:,1:end-1);

veclength = sqrt(vec.^2 + ones(Xsize(1), Xsize(2)-1));
curve = sum(veclength, 2);

si = 1 - flat/mean(curve);

end


