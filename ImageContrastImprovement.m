close all;

CameraPhoto = ReadImageFromWorkspace('12V_400ns.png');
figure('Name', 'Original Photo');
DisplayImage(CameraPhoto);

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA
figure('Name', 'Histogram Equalization')
PhotoAfterHistogramEqualization = HistogramEqualization(CameraPhoto); 
DisplayImage(PhotoAfterHistogramEqualization);

figure('Name', 'Histogram Equalization then Contrast Stretching')
PhotoAfterContrastStretching = ContrastStretching(PhotoAfterHistogramEqualization);
DisplayImage(PhotoAfterContrastStretching);

figure('Name', 'Histogram Equalization then Contrast Stretching then 3x3 Averaging Filter')
PhotoAfterAveragingFilter = filter2(fspecial('average',2),PhotoAfterContrastStretching)/255;
DisplayImage(PhotoAfterAveragingFilter);