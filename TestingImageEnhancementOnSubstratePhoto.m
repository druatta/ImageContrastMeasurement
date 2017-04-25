close all;
CameraPhoto = imread('12V_400nsStrobePulse_Image.png');
figure
DisplayImage(CameraPhoto);

figure
I = RunHistogramEqualization(CameraPhoto);
DisplayImage(I)

I3 = imadjust(I);
imshow(I3);

bw = imbinarize(I3);
bw = bwareaopen(bw, 50);
imshow(bw)


% Testing connected components
cc = bwconncomp(bw, 8)
cc.NumObjects
labeled = labelmatrix(cc);
I3 = imadjust(labeled);
DisplayImage(I3);
RGB_label = label2rgb(labeled, @spring, 'c', 'shuffle');
%imshow(RGB_label)

graindata = regionprops(cc, 'basic')

