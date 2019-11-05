function images = makeDataset(mysize, t, M0, relaxationTime, mymodel)

signal = zeros(length(t),length(relaxationTime));
for itissue = 1:length(relaxationTime)
    signal(:,itissue) = mymodel(t, M0(itissue), relaxationTime(itissue));
end

mask = makeHeartMask(mysize);

images = zeros(mysize(2), mysize(1), 1, length(t));
for t = 1:length(t)
    for itissue = 1:length(relaxationTime)
        temp = images(:,:,1,t);
        temp(mask == itissue) = signal(t,itissue);
        images(:,:,1,t) = temp;
    end
end

end



