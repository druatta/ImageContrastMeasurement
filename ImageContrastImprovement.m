close all;

CameraPhoto = ReadImageFromWorkspace('[0.2,60] Quad LED with helping hands.bmp');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

figure('Name','Photo After Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto);
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name', 'Photo After Histogram Equalization then Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastStretching);