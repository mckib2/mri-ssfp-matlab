function [ idx, idy ] = select_patch(ims)
    figure;
    [~, rect] = imcrop(abs(ims),[]);
    xmin = rect(1); ymin = rect(2);
    width = rect(3); height = rect(4);
    idy = floor(ymin):floor((ymin+height));
    idx = floor(xmin):floor((xmin+width));
end