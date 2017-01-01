% Main Function: quantipatch
% To quantify the patchiness in a 2-dimensional space

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016

% Starting a new analysis so we want to eliminate all old variables

clear all
close all

% I decided to use automatic method for data collection:

prompt = 'What is your folder?: ';
disp('e.g.  /Users/DoerLBH/Dropbox/git/OLab_patch_processor_3.0/test');
path = input(prompt,'s');
% /Users/DoerLBH/Dropbox/git/OLab_patch_processor_3.0/test

% So that I can specify a folder to access all data files.

[~,list] = system(['find ' path ' -type f -name "*.tif"']);

system(['mkdir ' path '/output-' date]);
system(['cd ' path '/output-' date]);

diary(strcat(path, '/output-', date, '/report_', date, '.out'));
diary on;
disp(path);
disp(date);

files = strsplit(list);
length(files);

files = unique(files);
files = files(~cellfun('isempty',files));

% calculate the patch index

for f = 1 : length(files)
    
    file = files{f};
    pi = patchindex(file);
    disp('---------------------');
    disp(strcat('file: ',strcat(file)));
    disp(strcat('patch index: ', num2str(pi)));
   
end





