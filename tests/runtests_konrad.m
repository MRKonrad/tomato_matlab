function runtests_konrad( folder )
%RUNTESTS_KONRAD alternative basic runtests

list = dir(fullfile(folder, '*Test.m'));

if length(list) < 1, warning(['No *Test.m files in ', folder]), return, end

if ~isfield(list,'folder')
    for i = 1:length(list)
        list(i).folder = folder;
    end
end

setGlobalTestFilesList(list)

for k = 1:length(list)
    try
        list = getGlobalTestFilesList();
        file = list(k).name;
        folder = list(k).folder;
        fprintf('### Running %s\n', file);
        run(fullfile(folder, file));
        fprintf('### Tests ok in %s\n', file);
    catch ex
        list = getGlobalTestFilesList();
        file = list(k).name;
        error('### Failed: %s\n', file);
    end
end

fprintf('\n\nAll tests passed\n')

end

