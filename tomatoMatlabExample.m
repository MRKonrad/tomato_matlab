%% SETUP

SETUP

%% Option 1: function using yaml file

yamlFilePath = 'testData/tomatoConfig_Shmolli_inputFilePaths.yaml';
[ maps ] = tomatoMatlabYaml( yamlFilePath );

imshow(maps.T1(:,:,1),[])

%% Option 2: function using tomatoStruct

MyTomatoMatlabStruct = TomatoMatlabStruct;
MyTomatoMatlabStruct.dir_magnitude = 'testData/dicom/Hcmr_Phantom_1916_260C/Konrad_Shmolli/ShMOLLI_192i_e11_12';
MyTomatoMatlabStruct.dir_output_map = 'testData/MyTomatoMatlabStructOtput';
[ maps ] = tomatoMatlabFunction( MyTomatoMatlabStruct );

imshow(maps.T1(:,:,1),[])