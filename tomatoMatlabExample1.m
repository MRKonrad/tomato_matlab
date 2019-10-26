tomatoMatlabSetup

%% running tomato with a function using yaml file

yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
[ maps ] = tomatoMatlabYaml( yamlFilePath );

if isempty(maps), return, end

imshow(maps.T1(:,:,1),[])
