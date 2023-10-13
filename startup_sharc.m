%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022
%            02/2023 edited for Sharc

disp('Running NJS startup.m...');

% Github
disp('Loading Github paths...');
base_string = '/shared/plus1/user/md1njst/github/';
paths = dir(base_string);
paths = paths(~ismember({paths.name},{'.','..'}));
for p = 1:length(paths)
    path = strcat(base_string,paths(p).name);
    if exist(path,'dir')
        addpath(genpath(path));
    end
end

% remove conflicting Ox path
rmpath(genpath(strcat(base_string,'ge-rawdata/orchestra-sdk-2.0-1.matlab')));

% Matlab-Schemer
schemer_import(strcat(base_string,filesep,'matlab-schemer',filesep,...
    'schemes',filesep,'monokai.prf'));

% Gitlab
disp('Loading Gitlab paths...');
base_string = '/shared/plus1/user/md1njst/gitlab/';
paths = dir(base_string);
paths = paths(~ismember({paths.name},{'.','..'}));
for p = 1:length(paths)
    path = strcat(base_string,paths(p).name);
    if exist(path,'dir')
        addpath(genpath(path));
    end
end

disp('Done...');
