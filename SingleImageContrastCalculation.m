close all;
RGBImage = ReadImageFromWorkspace('TestImage.bmp');

figure('Name', 'Camera Photo')
DisplayImage(RGBImage);
GrayscaleImage = ConvertRGBToGrayscale(RGBImage);

figure('Name', 'Camera Photo Gray Intensity');
imhist(GrayscaleImage);

% We use histogram equalization: 
% Histogram equalization paper: https://www.math.uci.edu/icamp/courses/math77c/demos/hist_eq.pdf
% Histogram equalization video: https://www.youtube.com/watch?v=PD5d7EKYLcA
I2 = histeq(GrayscaleImage); 
figure('Name', 'One Histogram Equalization');
DisplayImage(I2);

figure('Name', 'One Histogram Equalizion Gray Intensity');


I3 = histeq(I2);
figure ('Name', 'Two Histogram Equalizations');
DisplayImage(I3);