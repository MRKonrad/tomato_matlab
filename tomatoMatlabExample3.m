tomatoMatlabSetup

%% running tomato with a function using tomatoStruct

MyTomatoMatlabStruct = TomatoMatlabStruct;
MyTomatoMatlabStruct.dir_magnitude = 'testData/dicomT1/raw';
MyTomatoMatlabStruct.dir_output_map = 'testData/MyTomatoMatlabStructOtput';
[ maps ] = tomatoMatlabFunction( MyTomatoMatlabStruct );

if isempty(maps), return, end

imshow(maps.T1(:,:,1),[])

%% running tomato with a function using tomatoStruct

MyTomatoMatlabStruct = TomatoMatlabStruct;
MyTomatoMatlabStruct.dir_magnitude = 'testData/dicomT2/raw';
MyTomatoMatlabStruct.dir_output_map = 'temp/MyTomatoMatlabStructOtput';
[ maps ] = tomatoMatlabFunction( MyTomatoMatlabStruct );

if isempty(maps), return, end
%%
imshow(maps.T1(:,:,2),[])