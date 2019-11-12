%% test passing a struct should not crash
pwd

if isOctave
    %%% not working because octave does not know how to import, hence it
    %%% cannot use yamlmatlab
%     yamlFilePath = '../testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
%     mystruct = yaml.ReadYaml(yamlFilePath);
%     playground_octave_mex(mystruct);
else
    yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
    mystruct = yaml.ReadYaml(yamlFilePath);
    playground_matlab_mex(mystruct);
end
