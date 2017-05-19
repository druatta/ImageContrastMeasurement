close all

CameraPhoto = ReadImageFromWorkspace('[1,95].bmp');
figure('Name', 'Raw Image');
DisplayImage(CameraPhoto);

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(CameraPhoto, PSF, 'conv', 'circular');
figure('Name','Photo After Histogram Equalization then Thresholding then a 3x3 Averaging Filter then Motion Blur')
imshow(blurred)

noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Simulate Blur and Noise')

estimated_nsr = noise_var / var(PhotoAfter_3x3_AveragingFilter(:));
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration of Blurred, Noisy Image Using Estimated NSR');

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(wnr3);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterLocallyAdaptiveThresholding);

figure('Name','Photo After Histogram Equalization then Thresholding then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterLocallyAdaptiveThresholding);
DisplayImage(PhotoAfter_3x3_AveragingFilter);

