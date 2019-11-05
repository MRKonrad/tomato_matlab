clear

T1 = [900, 1000, 1600,1500];
M0 = [200, 190, 220, 190];
TI = [100, 180, 260, 1100, 2100, 3100, 4100];
TE = ones(1, length(TI));
TR = ones(1, length(TI));

mysize = [208, 256];

modelT1 = @ (TI, M0, T1) abs(M0*(1 - 2*exp(-TI/T1)));

images = makeDataset(mysize, TI, M0, T1, modelT1);
saveImages2Dicom(images, fullfile('testData','dicomT1'), TE, TR, TI);


