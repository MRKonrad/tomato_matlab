function [ outputTomatoExePath ] = getTomatoExePath( )
%GETTOMATOEXEPATH Summary of this function goes here
%   Detailed explanation goes here

global tomatoExePath;

if ~exist(tomatoExePath, 'file')
    error('getTomatoExePath: please provide an existing TomatoExe file')
end

outputTomatoExePath = tomatoExePath;

end

