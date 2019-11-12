%% SETUP

% provide TomatoMatlabToolbox matlab path
addpath(genpath(fullfile(pwd,'mat')));
addpath(genpath(fullfile(pwd,'mex')));
if isOctave
    addpath(genpath(fullfile(pwd, 'octaveOnly')))
end

% provide TomatoExe file path
if ispc
    setTomatoExePath(fullfile(pwd, 'TomatoExe', 'TomatoExe.exe'));
else
    setTomatoExePath(fullfile(pwd, 'TomatoExe', 'TomatoExe'));
end

% add yamlmatlab to the matlab path
addpath(genpath(fullfile(pwd,'thirdparty/yamlmatlab')));