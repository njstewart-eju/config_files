%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022

%% Set-up paths independent of OS
if ispc; userdir= getenv('USERPROFILE');
else; userdir= getenv('HOME');
end

% Github
disp('Loading NJS paths...');
base_string = strcat(userdir,filesep,'Documents',filesep,'github',filesep);
paths = dir(base_string);
paths = paths(~ismember({paths.name},{'.','..'}));
for p = 1:length(paths)
    path = strcat(base_string,paths(p).name);
    if exist(path,'dir')
        addpath(genpath(path));
    end
end

% Remove conflicting Ox path
disp('Removing conflicting paths...');
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab')));
% Remove conflicting read_MR paths
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'ge-rawdata',filesep,'read_mr14')));
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'ge-rawdata',filesep,'read_mr23')));
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'ge-rawdata',filesep,'read_MR_DV26_7T')));
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'glhosvd')));
rmpath(genpath(strcat(userdir,filesep,'Documents',filesep,'github',filesep,'imoco_recon')));

% Matlab-Schemer
schemer_import(strcat(userdir,filesep,'Documents',filesep,'github',filesep,...
    'matlab-schemer',filesep,'schemes',filesep,'monokai.prf'));

% Gitlab
base_string = strcat(userdir,filesep,'Documents',filesep,'gitlab',filesep);
paths = dir(base_string);
paths = paths(~ismember({paths.name},{'.','..'}));
for p = 1:length(paths)
    path = strcat(base_string,paths(p).name);
    if exist(path,'dir')
        addpath(genpath(path));
    end
end

disp('Done...');
