function images = makeDataset(mysize, t, M0, relaxationTime, mymodel)

signal = zeros(length(t),length(relaxationTime));
for itissue = 1:length(relaxationTime)
    signal(:,itissue) = mymodel(t, M0(itissue), relaxationTime(itissue));
end

mask = makeHeartMask(mysize);

images.raw = zeros(mysize(2), mysize(1), 1, length(t));
for t = 1:length(t)
    for itissue = 1:length(relaxationTime)
        temp = images.raw(:,:,1,t);
        temp(mask == itissue) = signal(t,itissue);
        images.raw(:,:,1,t) = temp;
    end
end

images.map = zeros(mysize(2), mysize(1));
for itissue = 1:length(relaxationTime)
    images.map(mask == itissue) = relaxationTime(itissue);
end

end



