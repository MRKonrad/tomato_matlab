function inputImages = tomatoMatlabGetInputImagesFromYaml(yamlpath)

    inputImages = struct;

    % get ready to use output yaml
    InputYamlStruct = yaml.ReadYaml(yamlpath);
    if isfield(InputYamlStruct, 'dir_output_map')
        outputyamlpath = fullfile(InputYamlStruct.dir_output_map, 'tomato_output_config.yaml');
    else
        outputyamlpath = fullfile('map', 'tomato_output_config.yaml');
    end

    % read dicoms
    YamlStruct = yaml.ReadYaml(outputyamlpath);
    if isfield(YamlStruct, 'files_magnitude') && ~isempty(YamlStruct.files_magnitude)
        inputImages.magnitude = getImagesFromList(YamlStruct.files_magnitude);
    elseif isfield(YamlStruct, 'dir_magnitude') && ~isempty(YamlStruct.dir_magnitude) 
        inputImages.magnitude = getImagesFromDir(YamlStruct.dir_magnitude);
    end
    if isfield(YamlStruct, 'files_phase') && ~isempty(YamlStruct.files_phase)
        inputImages.phase = getImagesFromList(YamlStruct.files_phase);
    elseif isfield(YamlStruct, 'dir_phase') && ~isempty(YamlStruct.dir_phase) 
        inputImages.phase = getImagesFromDir(YamlStruct.dir_phase);
    end

end

function out = getImagesFromList(mylist)
    out = [];
    for i = 1:length(YamlStruct.files_magnitude)
        out(:,:,i) = dicomread(mylist{i});
    end
end

function out = getImagesFromDir(mydir)
    out = [];
    files = dir(mydir);
    files = files(~ismember({files.name},{'.','..'}));
    nFiles = 0;
    for iFile = 1:length(files)
        try
            temp = dicomread(fullfile(mydir,files(iFile).name));
        catch ex
            continue
        end
        nFiles = nFiles + 1;
        out(:,:,nFiles) = temp;
    end
end