close all;
CameraPhoto = imread('12V_400nsStrobePulse_Image.png');
figure
DisplayImage(CameraPhoto);

figure
I = RunHistogramEqualization(CameraPhoto);
DisplayImage(I)


BW1 = edge(I,'canny');
figure('Name', 'Canny filter');
imshow(BW1)


% % Testing connected components
% cc = bwconncomp(bw, 8)
% cc.NumObjects
% labeled = labelmatrix(cc);
% RGB_label = label2rgb(labeled, @spring, 'c', 'shuffle');
% imshow(RGB_label)
% 
% graindata = regionprops(cc, 'basic')


% I3 = imadjust(I);
% imshow(I3);
% 
% bw = imbinarize(I3);
% bw = bwareaopen(bw, 50);
% imshow(bw)


