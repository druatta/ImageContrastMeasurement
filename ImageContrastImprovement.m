close all;

CameraPhoto = ReadImageFromWorkspace('[1,30] (1).bmp');
figure('Name', 'Camera Photo: Image Quality');
DisplayImage(CameraPhoto);

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA
figure('Name', 'One Histogram Equalizion: Image Quality')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto); 
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name', 'Photo after Histogram Equalization and Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastStretching);