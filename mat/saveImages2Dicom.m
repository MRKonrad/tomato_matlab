function saveimages2Dicom(images, saveDir, TE, TR, TI)

if ~exist('TE','var') || isempty(TE)
    TE = ones(1, size(images.raw,4));
end

if ~exist('TR','var') || isempty(TR)
    TR = ones(1, size(images.raw,4));
end

if ~exist('TI','var') || isempty(TI)
    TI = ones(1, size(images.raw,4));
end

saveDirRaw = fullfile(saveDir, 'raw');
saveDirMap = fullfile(saveDir, 'map');

mkdir(saveDirRaw)
mkdir(saveDirMap)

filePathRootRaw = fullfile(saveDirRaw, 'image');
filePathRootMap = fullfile(saveDirMap, 'map');

StudyInstanceUID = '';
SeriesInstanceUID = '';

for i = 1:size(images.raw,4)
    filename = [filePathRootRaw, sprintf('%04.f', i), '.dcm'];
    myimage = uint16(images.raw(:,:,1,i));
    dicomwrite(images.raw(:,:,1,i), filename, 'IOD', 'MR Image Storage');
    dicomTags = dicominfo(filename);
    
    dicomTags.EchoTime = TE(i);
    dicomTags.RepetitionTime = TR(i);
    dicomTags.InversionTime = TI(i);
    dicomTags.LargestImagePixelValue = max(myimage(:));
    if isempty(StudyInstanceUID)
        StudyInstanceUID = dicomTags.StudyInstanceUID;
    else
        dicomTags.StudyInstanceUID = StudyInstanceUID;
    end
    if isempty(SeriesInstanceUID)
        SeriesInstanceUID = dicomTags.SeriesInstanceUID;
    else
        dicomTags.SeriesInstanceUID = SeriesInstanceUID;
    end
    dicomwrite(myimage, filename, dicomTags, 'CreateMode', 'copy', 'IOD', 'MR Image Storage');
end


SeriesInstanceUID = '';

for i = 1:size(images.map,4)
    filename = [filePathRootMap, sprintf('%04.f', i), '.dcm'];
    myimage = uint16(images.map(:,:,1,i));
    dicomwrite(images.map(:,:,1,i), filename, 'IOD', 'Secondary Capture Image Storage');
    dicomTags = dicominfo(filename);
    
    dicomTags.LargestImagePixelValue = max(myimage(:));
    dicomTags.StudyInstanceUID = StudyInstanceUID;
    
    if isempty(SeriesInstanceUID)
        SeriesInstanceUID = dicomTags.SeriesInstanceUID;
    else
        dicomTags.SeriesInstanceUID = SeriesInstanceUID;
    end
    dicomwrite(myimage, filename, dicomTags, 'CreateMode', 'copy', 'IOD', 'Secondary Capture Image Storage');
end

end