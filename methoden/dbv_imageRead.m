function img = dbv_imageRead(filename, colormode)
img = imread(filename);
if (strcmp(colormode, 'gray'))
    img = rgb2gray(img);
end