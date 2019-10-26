function runtests_konrad( folder )
%RUNTESTS_KONRAD alternative basic runtests

list = dir(fullfile(folder, '*Test.m'));
setGlobalTestFilesList(list)

for k = 1:length(list)
    try
        list = getGlobalTestFilesList();
        file = list(k).name;
        folder = list(k).folder;
        run(fullfile(folder, file));
        fprintf('.')
    catch ex
        list = getGlobalTestFilesList();
        file = list(k).name;
%         error('failed: %s\n', file);
        error(ex)
    end
end

fprintf('\n\nAll tests passed\n')

end

