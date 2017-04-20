close all;
CameraPhoto = ReadImageFromWorkspace('12V_400nsStrobePulse_Image.png');

figure('Name', 'Camera Photo')
DisplayImage(CameraPhoto);
figure('Name', 'Camera Photo Gray Intensity');
imhist(CameraPhoto);

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA
OneHistogramEqualization = histeq(GrayscaleImage); 
figure('Name', 'One histogram equalizion: Image quality');
DisplayImage(OneHistogramEqualization);
figure('Name', 'One histogram equalizion: Gray Intensity');
imhist(OneHistogramEqualization);

TwoHistogramEqualizations = histeq(OneHistogramEqualization);
figure ('Name', 'Two histogram equalizations: Image quality');
DisplayImage(TwoHistogramEqualizations);
figure('Name', 'Two histogram equalizations: Gray Intensity')
imhist(TwoHistogramEqualizations);