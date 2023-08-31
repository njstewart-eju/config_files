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
