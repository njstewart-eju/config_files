%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022

%% Set-up paths independent of OS
if ispc; userdir= getenv('USERPROFILE');
else; userdir= getenv('HOME');
end

% Github
disp('Loading NJS paths...');
base_string = fullfile(userdir,'Documents','github');

%% NJS Repos
addpath(genpath(fullfile(base_string,'Matlab_MRI')));
addpath(genpath(fullfile(base_string,'ute-utilities')));
addpath(genpath(fullfile(base_string,'teaching-resources')));

%% External Tools

% GE Tools
addpath(genpath(fullfile(base_string,'ge-rawdata','orchestra-sdk-2.1-1.matlab')));
addpath(genpath(fullfile(base_string,'ge-rawdata','read_mr_latest')));
addpath(genpath(fullfile(base_string,'mns-research-pack')));
% ISMRMD
addpath(genpath(fullfile(base_string,'ismrmd')));
addpath(genpath(fullfile(base_string,'mrd/matlab')));
% TOPPE: Pulseq interpreter for GE
addpath(genpath(fullfile(base_string,'toppe')));
% Fordanic / Forsberg image registrations
addpath(genpath(fullfile(base_string,'image-registration')));

% Matlab Schemer - no longer needed for Matlab 2025b
% addpath(genpath(fullfile(base_string,'matlab-schemer')));
% schemer_import(fullfile(userdir,'Documents','github','matlab-schemer','schemes','monokai.prf'));
% Fasta algorithm - not currently using
% addpath(genpath(fullfile(base_string,'fasta-matlab')));

%% plab
plab_path = '/mnt/xdrive/plus1/slib/dev/plab/';
if exist(plab_path,'dir')
	disp('Adding plab to path..');
	addpath('/mnt/xdrive/plus1/slib/dev/plab/');
else
	disp('plab could not be added to path...');
end

% Bart
% bart_path = fullfile(base_string,'bart');
% addpath(fullfile(bart_path,'matlab'));
% Assuming bart is in /usr/bin as installed via apt so don't need to set BART_TOOLBOX_PATH.
% If instead we want to use the bart in bart_path, run the below.
% setenv('BART_TOOLBOX_PATH', bart_path);

disp('Done...');
