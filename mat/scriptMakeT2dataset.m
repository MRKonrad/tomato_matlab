clear

T2 = [40, 30, 80, 70];
M0 = [100, 90, 120, 130];
TE = [ 0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500];
mysize = [208, 256];

modelT2 = @ (TE, M0, T2) M0.*exp(-TE/T2);

images = makeDataset(mysize, TE, M0, T2, modelT2);
saveImages2Dicom(images, fullfile('testData','dicomT2'), TE);


