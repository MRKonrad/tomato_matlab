%% test passing a struct should not crash

yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
mystruct = yaml.ReadYaml(yamlFilePath);

if isOctave
    playground_octave_mex(mystruct);
else
    playground_matlab_mex(mystruct);
end

% MyTomatoMatlabStruct = TomatoMatlabStruct;
% playground_matlab_mex(struct(MyTomatoMatlabStruct));