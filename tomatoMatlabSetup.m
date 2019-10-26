%% SETUP

% provide TomatoMatlabToolbox matlab path
addpath(genpath(fullfile(pwd,'mat')));
addpath(genpath(fullfile(pwd,'mex')));

% provide TomatoExe file path
if ispc
    setTomatoExePath('TomatoExe/TomatoExe.exe');
else
    setTomatoExePath('TomatoExe/TomatoExe');
end

% add yamlmatlab to the matlab path
addpath(genpath(fullfile(pwd,'thirdparty/yamlmatlab')));