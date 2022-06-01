%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022

disp('Running NJS startup.m...');

%% Set-up paths independent of OS
if ispc; userdir= getenv('USERPROFILE');
else; userdir= getenv('HOME');
end

% Github
disp('Loading Github paths...');
base_string = strcat(userdir,filesep,'Documents',filesep,'github');
addpath(strcat(base_string,filesep,'Matlab_MRI'));
addpath(strcat(base_string,filesep,'matlab-schemer'));

% Gitlab
disp('Loading Gitlab paths...');
base_string = strcat(userdir,filesep,'Documents',filesep,'gitlab');
addpath(strcat(base_string,filesep,'ge-rawdata',filesep,'read_mr_latest'));
addpath(strcat(base_string,filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab'));
addpath(strcat(base_string,filesep,'philips-rawdata'));
addpath(strcat(base_string,filesep,'mns-research-pack'));
addpath(strcat(base_string,filesep,'tensor_toolbox'));
addpath(strcat(base_string,filesep,'zte_recon'));
addpath(strcat(base_string,filesep,'plab'));

clear;
disp('Done...');
