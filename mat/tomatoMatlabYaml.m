function [ maps, inputImages ] = tomatoMatlabYaml( yamlpath )
%RUNTOMATO Summary of this function goes here
%   Detailed explanation goes here

    maps = [];
    inputImages = [];

    exepath = getTomatoExePath;
    system([exepath, ' ', yamlpath]);

    % Octave does not handle Yaml parsing
    if isOctave
        warning('this functionality has not be implemented for Octave'); 
        return
    end
    
    if nargout > 0
        maps = tomatoMatlabGetMapsFromYaml(yamlpath);
    end

    if nargout > 1
        inputImages = tomatoMatlabGetInputImagesFromYaml(yamlpath);
    end

end

function [maps, clut] = tomatoMatlabGetMapsFromYaml(yamlpath)
    maps = struct;
    clut = [];

    % get ready to use output yaml
    InputYamlStruct = yaml.ReadYaml(yamlpath);
    if isfield(InputYamlStruct, 'dir_output_map')
        outputyamlpath = fullfile(InputYamlStruct.dir_output_map, 'tomato_output_config.yaml');
    else
        outputyamlpath = fullfile('map', 'tomato_output_config.yaml');
    end

    % or use input yaml if output yaml not found
    if ~exist(outputyamlpath, 'file')
        outputyamlpath = yamlpath; 
    end
    
    % read dicoms
    YamlStruct = yaml.ReadYaml(outputyamlpath);
    if isfield(YamlStruct, 'dir_output_map') && ~isempty(YamlStruct.dir_output_map)
        [maps.T1, maps.T1clut] = getImagesFromDir(YamlStruct.dir_output_map);
        if isfield(YamlStruct, 'dir_output_fitparams') && ~isempty(YamlStruct.dir_output_fitparams) 
            maps.fitparams = getImagesFromDir(YamlStruct.dir_output_fitparams);
        end
    end
end

function inputImages = tomatoMatlabGetInputImagesFromYaml(yamlpath)

    inputImages = struct;

    % get ready to use output yaml
    InputYamlStruct = yaml.ReadYaml(yamlpath);
    if isfield(InputYamlStruct, 'dir_output_map')
        outputyamlpath = fullfile(InputYamlStruct.dir_output_map, 'tomato_output_config.yaml');
    else
        outputyamlpath = fullfile('map', 'tomato_output_config.yaml');
    end

    % or use input yaml if output yaml not found
    if ~exist(outputyamlpath, 'file')
        outputyamlpath = yamlpath; 
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

function [images, clut] = getImagesFromList(mylist)
    images = [];
    for i = 1:length(YamlStruct.files_magnitude)
        [clut{i}, images(:,:,i)] = dicomread(mylist{i});
         
    end
end

function [images, clut] = getImagesFromDir(mydir)
    images = [];
    files = dir(mydir);
    files = files(~ismember({files.name},{'.','..', 'tomato_output_config.yaml'}));
    nFiles = 0;
    for iFile = 1:length(files)
        try
            [tempImage, tempClut] = dicomread(fullfile(mydir,files(iFile).name));
        catch ex
            continue
        end
        if ~isempty(tempImage)
            nFiles = nFiles + 1;
            images(:,:,nFiles) = tempImage;
            clut{nFiles} = tempClut;
        end
    end
end