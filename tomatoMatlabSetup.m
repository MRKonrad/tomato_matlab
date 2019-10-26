%% SETUP

% provide TomatoMatlabToolbox matlab path
addpath(genpath(fullfile(pwd,'mat')));
addpath(genpath(fullfile(pwd,'mex')));

% provide TomatoExe file path
if ispc
    setTomatoExePath(fullfile('TomatoExe', 'TomatoExe.exe'));
else
    setTomatoExePath(fullfile('TomatoExe', 'TomatoExe'));
end

% add yamlmatlab to the matlab path
addpath(genpath(fullfile(pwd,'thirdparty/yamlmatlab')));