close all

CameraPhoto = ReadImageFromWorkspace('[40,6] Quad LEDs + Optics.bmp');
figure('Name', 'Raw Image');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name','Photo After Histogram Equalization then Contrast Adjustment')
PhotoAfterContrastAdjustment = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastAdjustment);

figure('Name','Estimated Background Illumination')
AdaptiveThreshold = adaptthresh(PhotoAfterHistogramEqualization,0.9,'ForegroundPolarity','bright');
DisplayImage(AdaptiveThreshold)

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding')
PhotoAfterLocallyAdaptiveThresholding = imbinarize(PhotoAfterHistogramEqualization, AdaptiveThreshold);
DisplayImage(PhotoAfterLocallyAdaptiveThresholding);

figure('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter')
PhotoAfter_3x3_AveragingFilter = filter2(fspecial('average',3), PhotoAfterLocallyAdaptiveThresholding);
DisplayImage(PhotoAfter_3x3_AveragingFilter);