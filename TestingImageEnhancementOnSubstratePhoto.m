close all;
CameraPhoto = imread('12V_400nsStrobePulse_Image.png');
figure
DisplayImage(CameraPhoto);

figure
I = RunHistogramEqualization(CameraPhoto);
DisplayImage(I)
%% Step 2: Preprocess the Image to Enable Analysis
% In the sample image, the background illumination is brighter in the
% center of the image than at the bottom. As a preprocessing step before
% analysis, make the background uniform and then convert the image into a
% binary image. To make the background illumination more uniform, create an
% approximation of the background as a separate image and then subtract
% this approximation from the original image.


background = imopen(I,strel('square', 4));
%% 
% View the background approximation image as a surface to see where
% illumination varies. The |surf| command creates colored parametric
% surfaces that enable you to view mathematical functions over a
% rectangular region. Because the |surf| function requires data of class
% |double|, you first need to convert |background| using the |double|
% command. The example uses indexing syntax to view only 1 out of 8 pixels
% in each direction; otherwise, the surface plot would be too dense. The
% example also sets the scale of the plot to better match the range of the
% |uint8| data and reverses the y-axis of the display to provide a better
% view of the data. (The pixels at the bottom of the image appear at the
% front of the surface plot.) In the surface display, [0, 0] represents the
% origin, or upper-left corner of the image. The highest part of the curve
% indicates that the highest pixel values of background (and consequently
% |rice.png| ) occur near the middle rows of the image. The lowest pixel
% values occur at the bottom of the image.

surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');
%% 
% Subtract the background approximation image, |background|, from the
% original image, |I|, and view the resulting image. After subtracting the
% adjusted background image from the original image, the resulting image
% has a uniform background but is now a bit dark for analysis.
I2 = I - background;
imshow(I2)
%% 
% Use |imadjust| to increase the contrast of the processed image
% |I2| by saturating 1% of the data at both low and high intensities and by
% stretching the intensity values to fill the |uint8| dynamic range.
I3 = imadjust(I2);
imshow(I3);
%% 
% Create a binary version of the processed image so you can use toolbox
% functions for analysis. Use the |im2bw| function to convert the grayscale
% image into a binary image by using thresholding. The function
% |graythresh| automatically computes an appropriate threshold to use to
% convert the grayscale image to binary. Remove background noise with the
% |bwareaopen| function.
level = graythresh(I3);
bw = im2bw(I3,level);
bw = bwareaopen(bw, 10);
imshow(bw)
