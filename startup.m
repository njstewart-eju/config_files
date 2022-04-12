
%% Set-up paths independent of OS
if ispc; userdir= getenv('USERPROFILE');
else; userdir= getenv('HOME');
end

% Github
addpath(strcat(userdir,filesep,'Documents',filesep,'github',...
    filesep,'Matlab_MRI'));
addpath(strcat(userdir,filesep,'Documents',filesep,'github',...
    filesep,'matlab-schemer'));

% Gitlab
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'ge-rawdata',filesep,'read_mr_latest'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'philips-rawdata'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'mns-research-pack'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'tensor_toolbox'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'zte_recon'));
addpath(strcat(userdir,filesep,'Documents',filesep,'gitlab',...
    filesep,'plab'));

if ispc
%% Add WSL2 Ubuntu-installed BART to path
    run('Z:\home\njs\bart\startup.m');
end
