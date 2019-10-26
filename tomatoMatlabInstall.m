function tomatoMatlabInstall 

addpath(genpath('mat'));

tomatoExeVersion = '0.4.1';

tempDir = 'temp';
mkdir(tempDir)

if ismac
    platform = 'osx';
elseif isunix
    platform = 'linux';
elseif ispc
    platform = 'Windows_x64';
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% download tomatoExe %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

tomatoExeZipUrl = ...
    ['https://github.com/MRKonrad/tomato/releases/download/v',...
     tomatoExeVersion, '/TomatoExe_v', tomatoExeVersion, '_', ...
     platform, '.zip'];
fprintf('Downloading %s\n', tomatoExeZipUrl);
if isOctave
    urlwrite(tomatoExeZipUrl, fullfile(tempDir, 'tomatoExe.zip'));
else 
    websave(fullfile(tempDir, 'tomatoExe.zip'), tomatoExeZipUrl);
end
unzip(fullfile(tempDir, 'tomatoExe.zip'), 'TomatoExe')
delete(fullfile(tempDir, 'tomatoExe.zip'))

%%%%%%%%%%%%%%%%%%%%%
%%% download data %%%
%%%%%%%%%%%%%%%%%%%%%

dataZipUrl = ...
    ['https://github.com/MRKonrad/tomato/releases/download/v',...
     tomatoExeVersion, '/testData.zip'];

fprintf('Downloading %s\n', dataZipUrl);
if isOctave
    urlwrite(dataZipUrl, fullfile(tempDir, 'testData.zip'));
else
    websave(fullfile(tempDir, 'testData.zip'), dataZipUrl);
end
unzip(fullfile(tempDir, 'testData.zip'), 'testData')
delete(fullfile(tempDir, 'testData.zip'))

% %%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% download tomatoMex %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% tomatoMexVersion = '0.1';
% tomatoMexZipUrl = ...
%     ['https://github.com/MRKonrad/tomato_matlab/releases/download/v',...
%      tomatoMexVersion, '/tomato_matlab_', platform_short, '.zip'];
% 
% % TODO: check if websave works in octave
% websave(fullfile(tempDir, 'tomatoMex.zip'), tomatoMexZipUrl);
% unzip(fullfile(tempDir, 'tomatoMex.zip'), 'mexcpp')
% delete(fullfile(tempDir, 'tomatoMex.zip'))

% cleanup
rmdir(tempDir)
