function displayMosaic(pic,rows,cols)


lePic = imread(pic); % load image
mosaic = []; % preallocate matricies
mosaic2 = [];

for r = 1:rows
    mosaic = [mosaic;lePic]; % concatenate on top of eachother
end

for c = 1:cols
       mosaic2 = [mosaic2,mosaic]; % for every column, concatenate the column of images
end

imshow(mosaic2); % show image

end