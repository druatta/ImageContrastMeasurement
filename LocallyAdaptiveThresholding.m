close all

CameraPhoto = ReadImageFromWorkspace('11V200ns.jpg');
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

figure ('Name','Photo After Histogram Equalization then Locally Adaptive Thresholding then a 3x3 Averaging Filter then Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfter_3x3_AveragingFilter);
DisplayImage(PhotoAfterContrastStretching);