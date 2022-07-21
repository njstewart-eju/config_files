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
paths = {strcat(filesep,'Matlab_MRI'),...
    strcat(filesep,'matlab-schemer')};
for p = 1:length(paths)
    path = strcat(base_string,paths{p});
    if exist(path,'dir')
        addpath(path);
    end
end

% Gitlab
disp('Loading Gitlab paths...');
base_string = strcat(userdir,filesep,'Documents',filesep,'gitlab');
paths = {strcat(filesep,'ge-rawdata',filesep,'read_mr_latest'),...
    strcat(filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab'),...
    strcat(filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab',filesep,'Scripts'),...
    strcat(filesep,'philips-rawdata'),...
    strcat(filesep,'mns-research-pack'),...
    strcat(filesep,'tensor_toolbox'),...
    strcat(filesep,'zte_recon'),...
    strcat(filesep,'plab')};
for p = 1:length(paths)
    path = strcat(base_string,paths{p});
    if exist(path,'dir')
        addpath(path);
    end
end

%% Add WSL2 Ubuntu-installed BART to path % assume work PC
if ispc 
    disp('Trying to load WSL2 BART startup.m...');
    bartPath = 'Z:\home\njs\bart\startup.m';
    if isfile(bartPath)
        run(bartPath);
    end
end

disp('Done...');