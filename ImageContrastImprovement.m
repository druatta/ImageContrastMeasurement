close all;

CameraPhoto = ReadImageFromWorkspace('[40,6] Quad LEDs + Optics.bmp');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name', 'Photo After Histogram Equalization then Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastStretching);