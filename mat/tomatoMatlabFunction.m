function [ maps, inputImages ] = tomatoMatlabFunction( MyTomatoMatlabStruct )
%RUNTOMATO Summary of this function goes here
%   Detailed explanation goes here

maps = [];
inputImages = [];

% Octave does not handle Yaml parsing
if isOctave
    warning('this functionality has not be implemented for Octave'); 
    return
end
    
if ~isstruct(MyTomatoMatlabStruct) && ~isa(MyTomatoMatlabStruct, 'TomatoMatlabStruct')
    error('tomatoMatlabFunction: I need structure as input')
end

tempDir = 'tomatoMatlabFunctionYamlTempDir';
tempFile = fullfile(tempDir, 'temp.yaml');
mkdir(tempDir);
yaml.WriteYaml(tempFile, struct(MyTomatoMatlabStruct), 0);

[ maps, inputImages ] = tomatoMatlabYaml( tempFile );

rmdir(tempDir, 's');

end

