tomatoMatlabSetup

%% running tomato with a function using tomatoStruct

MyTomatoMatlabStruct = TomatoMatlabStruct;
MyTomatoMatlabStruct.dir_magnitude = 'testData/dicom/Hcmr_Phantom_1916_260C/Konrad_Shmolli/ShMOLLI_192i_e11_12';
MyTomatoMatlabStruct.dir_output_map = 'testData/MyTomatoMatlabStructOtput';
[ maps ] = tomatoMatlabFunction( MyTomatoMatlabStruct );

if isempty(maps), return, end

imshow(maps.T1(:,:,1),[])