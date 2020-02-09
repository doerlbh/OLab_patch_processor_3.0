% Dependent Function: patchindex
% To normalize the image to be same exposure level

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016

function normalizedImage = normimag(image)

normalizedImage = 50*image /mean(mean(image));

% 50 is an arbitrary number to choose, but it does a good job.

end


