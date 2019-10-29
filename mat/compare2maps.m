function [ mapDiff ] = compare2maps(map1Filepath, map2Filepath, map2CorrectionFactor)
%COMPARE2MAPS Summary of this function goes here
%   Detailed explanation goes here

    if ~exist('map2CorrectionFactor', 'var'), map2CorrectionFactor = 1; end
    
    [map1, clut1] = dicomread(map1Filepath);
    [map2, clut2] = dicomread(map2Filepath);
    map1 = double(map1);
    map2 = double(map2) * map2CorrectionFactor;
    mapDiff = map1 - map2;
    mapDiffNonZero = mapDiff(mapDiff ~= 0);
    nbins = uint32(-min(mapDiff(:)) + max(mapDiff(:)));
    
    fprintf('map1    min: %f max: %f\n', min(map1(:)), max(map1(:)))
    fprintf('map2    min: %f max: %f\n', min(map2(:)), max(map2(:)))
    fprintf('mapDiff min: %f max: %f\n', min(mapDiff(:)), max(mapDiff(:)))
    fprintf('number of different pixels: %d, percent: %f\n', length(mapDiffNonZero(:)), 100*length(mapDiffNonZero(:))/length(mapDiff(:)))

    ax(1) = subplot(221);
    imshow(map1, clut1), colorbar
    title('map1', 'interpreter', 'none')
    ax(2) = subplot(222);
    imshow(map2, clut2), colorbar
    title('map2', 'interpreter', 'none')
    ax(3) = subplot(223);
    imshow(mapDiff, [-50 50]), colorbar
    title('map1 - map2', 'interpreter', 'none')
    colormap(ax(3),redblue)
    ax(4) = subplot(224);
    if nbins > 0
        histogram(mapDiffNonZero(:), nbins);
    end
    title('hist', 'interpreter', 'none')
  
    linkaxes(ax(1:3))
    axes(ax(1))
end

