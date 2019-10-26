function setTomatoExePath(inputTomatoExePath)
%TOMATOEXEPATH Summary of this function goes here
%   Detailed explanation goes here

global tomatoExePath;
tomatoExePath = inputTomatoExePath;

if ~exist(tomatoExePath, 'file')
    error('setTomatoExePath: please provide an existing TomatoExe file')
end

end


