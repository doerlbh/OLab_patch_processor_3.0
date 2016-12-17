% Dependent Function: patchindex
% To calculate the patchindex in a 2-dimensional space

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016

function pi = patchindex(file)

image = imread(file);
image = cast(image,'double'); 
image = normimag(image);
xindex = striatindex(image.');
yindex = striatindex(image);
pi = (xindex + yindex)/2;

end


