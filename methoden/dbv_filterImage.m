function filtered = dbv_filterImage(img, type, param)
switch type
    case 'average'
        h=fspecial('average', param);
        filtered = imfilter(img, h, 'conv');
    case 'gaussian'
        h=fspecial('gaussian', param);
        filtered = imfilter(img, h, 'conv');
    case 'median'
        filtered = medfilt2(img, param);
end