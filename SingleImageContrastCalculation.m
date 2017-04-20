close all;
CameraPhoto = ReadImageFromWorkspace('12V_400nsStrobePulse_Image.png');

subplot(221);
DisplayImage(CameraPhoto);
title('Camera Photo');

subplot(222);
imhist(CameraPhoto);
title('Camera Photo Intensity');

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA

OneHistogramEqualization = histeq(CameraPhoto); 

subplot(223);
DisplayImage(OneHistogramEqualization);
title('One histogram equalizion: Image quality');

subplot(224);
imhist(OneHistogramEqualization);
title('One histogram equalizion: Gray Intensity');
