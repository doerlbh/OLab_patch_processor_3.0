% Main Function: quantipatch
% To quantify the patchiness in a 2-dimensional space

% author:   Baihan Lin, for Olavarria Lab
% date:     Dec 2016
% update:   Dec 2017
% update:   Feb 2020

% Starting a new analysis so we want to eliminate all old variables

clear all
close all

% I decided to use automatic method for data collection:

prompt = 'What is your folder?: ';
disp('e.g.  /Users/DoerLBH/Dropbox/git/OLab_patch_processor_3.0/ME');
path = input(prompt,'s');
% /Users/DoerLBH/Dropbox/git/OLab_patch_processor_3.0/ME

% Note: you may specify a folder to access all data files.

[~,list] = system(['find ' path ' -type f -name "*.tif"']);
system(['mkdir ' path '/output-' date]);
system('cd /Users/DoerLBH/Dropbox/git/OLab_patch_processor_3.0/ME/output-09-Feb-2020');
% % system('pwd')
% system(['touch ' path '/output-' date ' report_' date '.out']);

% diary(strcat(path, '/output-', date, '/report_', date, '.out'));
diary('report_09-Feb-2020.txt');
diary on;
disp(path);
disp(date);

files = strsplit(list);
length(files);

files = unique(files);
files = files(~cellfun('isempty',files));

% calculate the patch index

record_curve = [];
record_sd = [];

for f = 1 : length(files)
    file = files{f};
    [pi_curve, pi_sd] = patchindex_SD(file);
    
    record_curve(f) = pi_curve;
    record_sd(f) = pi_sd;
    
    disp('---------------------');
    disp(strcat('file: ',strcat(file)));
    
    % patch index from curve method
    disp(strcat('patch index (curve method): ', num2str(pi_curve)));
    
    % patch index from sd method
    disp(strcat('patch index (sd method): ', num2str(pi_sd)));
end

disp('---------------------');
disp('control mean and std - first four images');
disp(strcat('patch index (curve method): ', num2str(mean(record_curve(1:4))),' +/- ', num2str(std(record_curve(1:4)))));
disp(strcat('patch index (sd method): ', num2str(mean(record_sd(1:4))),' +/- ', num2str(std(record_sd(1:4)))));
disp('---------------------');
disp('non-control mean and std - last twelve images');
disp(strcat('patch index (curve method): ', num2str(mean(record_curve(5:16))),' +/- ', num2str(std(record_curve(5:16)))));
disp(strcat('patch index (sd method): ', num2str(mean(record_sd(5:16))),' +/- ', num2str(std(record_sd(5:16)))));
diary off;


