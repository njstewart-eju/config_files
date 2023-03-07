%STARTUP - script that runs when Matlab starts!
%
% NJS (TUoS) 2022
%            02/2023 edited for Sharc
disp('Adding all folders + subfolders in MATLAB base directory to PATH');
basedir = '/shared/plus1/user/md1njst/MATLAB';
if exist(basedir,'dir')
    addpath(genpath(basedir));
else
    warning(['Path ' basedir ' does not exist...']);
end

% Matlab-Schemer
schemer_import(strcat(basedir,filesep,'matlab-schemer',filesep,...
    'schemes',filesep,'monokai.prf'));

disp('Done...');
