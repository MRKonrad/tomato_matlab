%% test passing a struct should not crash
pwd
yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
mystruct = yaml.ReadYaml(yamlFilePath)

if isOctave
    playground_octave_mex(mystruct);
else
    playground_matlab_mex(mystruct);
end
