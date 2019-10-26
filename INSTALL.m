function INSTALL 

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

% TODO: check if websave works in octave
websave(fullfile(tempDir, 'tomatoExe.zip'), tomatoExeZipUrl);
unzip(fullfile(tempDir, 'tomatoExe.zip'), 'TomatoExe')
delete(fullfile(tempDir, 'tomatoExe.zip'))

%%%%%%%%%%%%%%%%%%%%%
%%% download data %%%
%%%%%%%%%%%%%%%%%%%%%

dataZipUrl = ...
    ['https://github.com/MRKonrad/tomato/releases/download/v',...
     tomatoExeVersion, '/testData.zip'];

% TODO: check if websave works in octave
websave(fullfile(tempDir, 'testData.zip'), dataZipUrl);
unzip(fullfile(tempDir, 'testData.zip'), 'data')
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
% unzip(fullfile(tempDir, 'tomatoMex.zip'), 'mex')
% delete(fullfile(tempDir, 'tomatoMex.zip'))

% cleanup
rmdir(tempDir)
