close all

CameraPhoto = ReadImageFromWorkspace('[30,7] Quad LEDs + Optics.bmp');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization, 'adaptive');
DisplayImage(PhotoAfterLocallyAdaptiveThresholding);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterLocallyAdaptiveThresholding);
DisplayImage(PhotoAfter_3x3_AveragingFilter);