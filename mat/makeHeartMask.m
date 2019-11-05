function [mask, maskStruct] = makeHeartMask(mysize)
%MAKEHEARTMASK Summary of this function goes here
%   Detailed explanation goes here

    maskStruct.LV = makeCircle(mysize(1)/5, mysize, mysize/2 + [mysize(1)/10, 0]);
    maskStruct.LVblood = makeCircle(mysize(1)/7, mysize, mysize/2 + [mysize(1)/10, 0]);
    maskStruct.LVmyo = maskStruct.LV & ~maskStruct.LVblood;
    maskStruct.RV = makeCircle(mysize(1)/4, mysize, mysize/2 + [-mysize(1)/20, -mysize(1)/40]);
    maskStruct.RV = maskStruct.RV & ~ maskStruct.LV;
    maskStruct.RVblood = makeCircle(mysize(1)/5, mysize, mysize/2 + [-mysize(1)/20, -mysize(1)/40]);
    maskStruct.RVblood = maskStruct.RVblood & ~ maskStruct.LV;
    maskStruct.RVmyo = maskStruct.RV & ~ maskStruct.RVblood;

    mask = maskStruct.LVmyo*1 + maskStruct.RVmyo*2 + maskStruct.LVblood*3 + maskStruct.RVblood*4;

end