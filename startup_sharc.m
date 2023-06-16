%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022
%            02/2023 edited for Sharc

disp('Running NJS startup.m...');

% Github
disp('Loading Github paths...');
base_string = '/shared/plus1/user/md1njst/github';
paths = {strcat(filesep,'ge-rawdata',filesep,'read_mr_latest'),...
    strcat(filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab'),...
    strcat(filesep,'ge-rawdata',filesep,'gw_coils_files'),...
    strcat(filesep,'ge-rawdata',filesep,'orchestra-sdk-2.0-1.matlab',filesep,'Scripts'),...
    strcat(filesep,'Matlab_MRI'),...
    strcat(filesep,'mns-research-pack'),...
    strcat(filesep,'RetrospectiveGating'),...
    strcat(filesep,'matlab-schemer'),...
    strcat(filesep,'fasta-matlab'),...
    strcat(filesep,'fasta-matlab',filesep,'solvers')
    };
for p = 1:length(paths)
    path = strcat(base_string,paths{p});
    if exist(path,'dir')
        addpath(path);
    end
end

% Matlab-Schemer
schemer_import(strcat(base_string,filesep,'matlab-schemer',filesep,...
    'schemes',filesep,'monokai.prf'));

% Gitlab
disp('Loading Gitlab paths...');
base_string = '/shared/plus1/user/md1njst/gitlab';
paths = {strcat(filesep,'tensor_toolbox')
    };
for p = 1:length(paths)
    path = strcat(base_string,paths{p});
    if exist(path,'dir')
        addpath(path);
    end
end

disp('Done...');
