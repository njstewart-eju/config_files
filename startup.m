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

% Matlab-Schemer
schemer_import(strcat(userdir,filesep,'Documents',filesep,'github',filesep,...
    'matlab-schemer',filesep,'schemes',filesep,'monokai.prf'));

% Gitlab
disp('Loading Gitlab paths...');
base_string = strcat(userdir,filesep,'Documents',filesep,'gitlab');
paths = {strcat(filesep,'ge-rawdata',filesep,'read_mr_latest'),...
    strcat(filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab'),...
    strcat(filesep,'ge-rawdata',filesep,'gw_coils_files'),...
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

%% Add BART to path
disp('Trying to run BART startup.m...');
if ispc 
    bartPath = 'Z:\home\njs\bart\startup.m';
else
    bartPath = '~/Documents/github/bart/startup.m';
end
if isfile(bartPath)
    run(bartPath);
end

disp('Done...');