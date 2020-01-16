function aufgabe13(filename, filtertype);

%Huffman_Kodierung Kapitel C 1.3

imgOriginal = dbv_imageRead(filename, 'gray');

huff = dbv_huffmanCodeLength(imgOriginal);

%a)
figure;
imhist(imgOriginal);

huff_bits = sum(huff .* imhist(imgOriginal));
bits = sum(8 .* imhist(imgOriginal));
bits/huff_bits

%b)
huff_bits = zeros([1,4])
 
for k = 1:4
    
    sigma = 1/1000*k^3;
    imgNoise = dbv_addNoise(imgOriginal, 'gaussian', sigma);
    huff = dbv_huffmanCodeLength(imgNoise);
    huff_bits(k) = sum(huff .* imhist(imgNoise));
    
    
    figure(2);
    subplot(3,4,k);
    imshow(imgNoise);
  
    
    %hist = imhist(imgNoise);
    subplot(3,4,k+4);
    imhist(imgNoise); %bei Histogrammen kein Imshow
    %imshow(hist);
    
    subplot(3,4,k+8);
    bar(huff);
    xlim([0,256]);
end
figure(3);
bar(huff_bits);