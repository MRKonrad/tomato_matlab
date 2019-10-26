function [ maps, inputImages ] = tomatoMatlabFunction( MyTomatoMatlabStruct )
%RUNTOMATO Summary of this function goes here
%   Detailed explanation goes here

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

