close all

CameraPhoto = ReadImageFromWorkspace('[40,6] Quad LEDs + Optics.bmp');
figure('Name', 'Raw Image');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name', 'Photo After Adaptive Histogram Equalization')
PhotoAfterAdaptiveHistogramEqualization = adapthisteq(CameraPhoto);
DisplayImage(PhotoAfterAdaptiveHistogramEqualization)

figure('Name', 'Comparing Histogram Equalization and Adaptive Histogram Equalization');
subplot(2,2,1)
DisplayImage(CameraPhoto);
title('Raw Image: [40us,6V] Quad LEDs + Optics');
subplot(2,2,2)
DisplayImage(PhotoAfterHistogramEqualization);
title('Photo After Histogram Equalization');
subplot(2,2,3)
DisplayImage(PhotoAfterAdaptiveHistogramEqualization);
title('Photo After Adaptive Histogram Equalization')