function apply (c,ims)
    im = c(1)*ones(size(ims(:,:,1))); % constant function
    for jj = 1:6
        im = im  + c(jj+1)*ims(:,:,jj);
    end
    figure;
    imshow(abs(im),[]);
    title('Basis Applied to Image');
end