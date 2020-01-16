function normed = dbv_normImage(img)

normed = im2double(img);
normed = normed - min(min(normed));
normed = normed ./ max(max(normed));
normed = im2uint8(real(normed));