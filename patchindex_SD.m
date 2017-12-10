% Dependent Function: patchindex
% To calculate the patchindex in a 2-dimensional space

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016
% update:   Dec 2017

function [pi_curve, pi_sd] = patchindex_SD(file)

image = imread(file);
image = cast(image,'double'); 
image = normimag(image);
[xsi_curve, xsi_sd] = striatindex_SD(image.');
[ysi_curve, ysi_sd] = striatindex_SD(image);

% patch index from curve method
pi_curve = (xsi_curve + ysi_curve)/2;

% patch index from sd method
pi_sd = (xsi_sd + ysi_sd)/2;

end


