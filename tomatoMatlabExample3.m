tomatoMatlabSetup

%% running tomato with a function using tomatoStruct

MyTomatoMatlabStruct = TomatoMatlabStruct;
MyTomatoMatlabStruct.dir_magnitude = 'testData/dicomT1';
MyTomatoMatlabStruct.dir_output_map = 'testData/MyTomatoMatlabStructOtput';
[ maps ] = tomatoMatlabFunction( MyTomatoMatlabStruct );

if isempty(maps), return, end

imshow(maps.T1(:,:,1),[])