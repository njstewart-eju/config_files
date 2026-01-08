%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022
%            02/2023 edited for Sharc

disp('Running NJS startup.m...');

base_string = '/shared/plus1/user/md1njst/github/';

%% NJS Repos
addpath(genpath(fullfile(base_string,'Matlab_MRI')));
addpath(genpath(fullfile(base_string,'ute-utilities')));

%% External Tools

% GE Tools
addpath(genpath(fullfile(base_string,'ge-rawdata','orchestra-sdk-2.1-1.matlab')));
addpath(genpath(fullfile(base_string,'ge-rawdata','read_mr_latest')));
addpath(genpath(fullfile(base_string,'mns-research-pack')));
% Fordanic / Forsberg image registrations
addpath(genpath(fullfile(base_string,'image-registration')));

% Matlab-Schemer
schemer_import(strcat(base_string,filesep,'matlab-schemer',filesep,...
    'schemes',filesep,'monokai.prf'));

plab_path = '/shared/plus1/slib/dev/plab/';
if exist(plab_path,'dir')
	disp('Adding plab to path..');
	addpath(plab_path);
else
	disp('plab could not be added to path...');
end

disp('Done...');
