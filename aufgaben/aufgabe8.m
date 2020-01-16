function aufgabe8(filename)

img = dbv_imageRead(filename, 'gray');
img = double(img);

%Aufgabenteil a
%2D FT berechnen, Normierung und Zentrierung des Spektrums

fft_img = fft2(img);
fft_img_shift = fftshift(fft_img);

img_amp = abs(fft_img_shift);
img_phase = angle(fft_img_shift);
%Aufgabenteil b
