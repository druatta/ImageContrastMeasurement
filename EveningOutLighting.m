close all

CameraPhoto = ReadImageFromWorkspace('[0.2,60] Quad LED with helping hands.bmp');
figure('Name', 'Raw Image');
DisplayImage(CameraPhoto);

figure('Name', 'Histogram of the Raw Image');
imhist(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Histogram After Histogram Equalization')
imhist(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Contrast Adjustment')
PhotoAfterContrastAdjustment = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastAdjustment);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterLocallyAdaptiveThresholding);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterLocallyAdaptiveThresholding);
DisplayImage(PhotoAfter_3x3_AveragingFilter);