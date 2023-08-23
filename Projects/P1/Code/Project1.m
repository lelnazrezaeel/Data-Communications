%import image(Part2)
I1 = imread('image.jpg');

%convert image to gray(Part3)
I2 = rgb2gray(I1);

%save and show origin image(Part4)
imwrite(I1,'origin.jpg');
figure;
imshow(I1);
title('origin image');
%save and show gray image(Part4)
imwrite(I2,'gray.jpg');
figure;
imshow(I2);
title('gray image');

%energy of image(Part5)
glcms = graycomatrix(I2);
stats = graycoprops(glcms);
disp(['Energy = ', num2str(stats.Energy)]);

%add noise to image and ...(Part6)
I3 = imnoise(I2,'gaussian',0,0.01);
figure;
imshow(I3);
title('noised image');
img=I3;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
snrVal=20*log10((ima-imi)./mse);
fprintf('\n The SNR value after adding noise is %0.4f', snrVal);
img1=I2;
img1=double(img1(:));
ima1=max(img1(:));
imi1=min(img1(:));
mse1=std(img1(:));
snrVal1=20*log10((ima1-imi1)./mse1);
fprintf('\n The SNR value before adding noise is %0.4f', snrVal1);

%frequency domain Gray-Scale(Part7)
I4 = fftshift(log(abs(fft2(I2))));
figure;
imshow(I4, []);
title('frequency domain gray');

%Remove noise from image(Part8)
I5 = medfilt2(I3);
figure;
imshow(I5);
title('noise removed');
[peaksnr, snr] = psnr(I5, I3);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);