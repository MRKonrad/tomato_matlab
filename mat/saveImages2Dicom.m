function saveImages2Dicom(images, saveDir, TE, TR, TI)

if ~exist('TE','var') || isempty(TE)
    TE = ones(1, size(images,4));
end

if ~exist('TR','var') || isempty(TR)
    TR = ones(1, size(images,4));
end

if ~exist('TI','var') || isempty(TI)
    TI = ones(1, size(images,4));
end

mkdir(saveDir)
filePathRoot = fullfile(saveDir, 'image');

StudyInstanceUID = '';
SeriesInstanceUID = '';

for i = 1:size(images,4)
    filename = [filePathRoot, sprintf('%04.f', i), '.dcm'];
    myimage = uint16(images(:,:,1,i));
    dicomwrite(images(:,:,1,i), filename, 'IOD', 'MR Image Storage');
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

end