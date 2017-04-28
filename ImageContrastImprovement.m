close all;

CameraPhoto = ReadImageFromWorkspace('12V_400nsStrobePulse_Image.png');
figure('Name', 'Camera Photo: Image Quality');
DisplayImage(CameraPhoto);

figure('Name', 'Camera Photo: Gray Intensity Histogram');
CreateHistogram(CameraPhoto);

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA
figure('Name', 'One Histogram Equalizion: Image Quality')
PhotoAfterHistogramEqualization = RunHistogramEqualization(CameraPhoto); 
DisplayImage(PhotoAfterHistogramEqualization);
