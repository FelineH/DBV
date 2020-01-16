function rms = dbv_rms(img1, img2)
[M,N] = size(img1);
%diff = imabsdiff(img1,img2);
diff = img1-img2;
 %rms = sqrt(immse(img1, img2)); err = immse(X,Y) calculates the mean-squared error (MSE) between the arrays X and Y
 rms = sqrt((1/(M*N))*sum(sum(diff.^2))); %mit . Quadrierung elementweise