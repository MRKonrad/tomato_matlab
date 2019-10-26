%% SETUP

% provide TomatoMatlabToolbox matlab path
addpath(genpath(fullfile(pwd,'mat')));

% provide TomatoExe file path
if ispc
    setTomatoExePath('TomatoExe/TomatoExe.exe');
else
    setTomatoExePath('TomatoExe/TomatoExe');
end

% add yamlmatlab to the matlab path
addpath(genpath(fullfile(pwd,'thirdparty/yamlmatlab')));