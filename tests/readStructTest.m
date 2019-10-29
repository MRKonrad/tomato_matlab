%% test passing a struct should not crash

yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
mystruct = yaml.ReadYaml(yamlFilePath);
playground_matlab_mex(mystruct);

% MyTomatoMatlabStruct = TomatoMatlabStruct;
% playground_matlab_mex(struct(MyTomatoMatlabStruct));