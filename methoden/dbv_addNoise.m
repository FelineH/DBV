function noisy = dbv_addNoise(img, type, param)
noisy = imnoise(img, type, 0, param); %Mittelwert auf 0 gesetzt