
% 
% f=[10, 25, 50, 75, 100, 250]
% 
% for i = 1:6
%     img = dbv_genSignal2D(f(i));
%     subplot(2,3,i)
%     imshow(img)
% end

img = dbv_genSignal2D(100);

img_fft=fft2(img);
img_fft_shift=fftshift(img_fft)/numel(img_fft);

figure(1)
imshow(img)

figure(2)
imshow(img_fft_shift)