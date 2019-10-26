%% SETUP

% provide TomatoMatlabToolbox matlab path
addpath(genpath('mat'));

% provide TomatoExe file path
if ispc
    setTomatoExePath('TomatoExe/TomatoExe.exe');
else
    setTomatoExePath('TomatoExe/TomatoExe');
end

% add yamlmatlab to the matlab path
addpath(genpath('thirdparty/yamlmatlab'));